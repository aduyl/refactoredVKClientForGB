//
//  GlobalGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit
import Foundation

protocol DataDelegate: AnyObject {
    func transferGroup(group: Groups)
}

class GlobalGroupController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    var network = NetworkLayer()
    var sentElement: Groups?
    let usersTableView = UITableView()
    var dataArray = [GroupsHeaderSection]()
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
        network.forecastGroups { result in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let data) :
                self.dataArray = sortByName(groupsArray: data)
                self.usersTableView.reloadData()
            }
        }
    }
    
    func configureTableView(){
        self.view.backgroundColor = .white
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
        usersTableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        usersTableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "GroupCell")
    }
    
    func configureNavigation() {
        let searchBar = UISearchBar(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.1), y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: 0, y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.dataArray[section]
        return  section.tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.configure(group: dataArray[indexPath.section].tableCell[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        return "\(dataArray[section].letter)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?{
        sentElement =  dataArray[indexPath.section].tableCell[indexPath.row]
        navigationController?.popViewController(animated: true)
        getGroupFromGlobal(sentElement!)
        return indexPath
    }
    
    @objc func pushNvigationButton(){
        navigationController?.popViewController(animated: true)
    }

}

extension GlobalGroupController {
    func getGroupFromGlobal(_ group: Groups){
        delegate?.transferGroup(group: group)
    }
}
