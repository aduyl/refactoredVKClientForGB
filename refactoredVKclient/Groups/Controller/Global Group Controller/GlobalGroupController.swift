//
//  GlobalGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit
import Foundation

protocol DataDelegate: AnyObject {
    func transferGroup(group: Group)
}

final class GlobalGroupController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    
    var network = NetworkLayer()
    var sentElement: Group?
    let tableView = UITableView()
    var data = [GroupsHeaderSection]()
    var searchBar = UISearchBar()
    weak var delegate: DataDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTableView()
        getData()
    }
    
    // MARK: - json parsing
    func getData() {
        network.downloadGroups {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error) :
                self.showAlert(alertText: "\(error)")
            case .success(let data) :
                self.data = sortByName(groups: data)
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Configure ui
    private func configureTableView(){
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "GroupCell")
    }
    
    private func configureNavigation() {
        let searchBar = UISearchBar(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.1), y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    // MARK: - Error alert
    func showAlert(alertText: String) {
        let alertController = UIAlertController(title: "Error", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configure tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.data[section]
        return  section.tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.configure(group: data[indexPath.section].tableCell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "\(data[section].letter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        sentElement =  data[indexPath.section].tableCell[indexPath.row]
        navigationController?.popViewController(animated: true)
        getGroupFromGlobal(sentElement!)
        return indexPath
    }
    
    @objc private func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }

}

extension GlobalGroupController {
    func getGroupFromGlobal(_ group: Group){
        delegate?.transferGroup(group: group)
    }
}
