//
//  UsersGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 16.07.2021.
//

import UIKit

final class UsersGroupController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    
    let tableView = UITableView()
    var data: [GroupsHeaderSection]
    var searchBar = UISearchBar()
    // MARK: initialization
    
    init() {
        self.data = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTableView()
    }
    
    private func configureNavigation() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.9), y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    private func configureTableView(){
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "GroupCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.data[section]
        return section.tableCell.count
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data[indexPath.section].tableCell.remove(at: indexPath.row)
        if data[indexPath.section].tableCell.count == 0 {
            data.remove(at: indexPath.section)
        }
        self.tableView.reloadData()
    }
    
    @objc private func pushNvigationButton(){
        let groupController = GlobalGroupController()
        groupController.delegate = self
        navigationController?.pushViewController(groupController, animated: true)
        
    }
}

extension UsersGroupController: DataDelegate {
    private func addReceivedItemToHeaderSection(item: Group) -> [GroupsHeaderSection]{
        var newGroups: [Group] = []
        for headerItem in data{
            for tableCellItem in headerItem.tableCell {
                if item.name == tableCellItem.name {
                    return data
                }
                newGroups.append(tableCellItem)
            }
        }
        newGroups.append(item)
        let tempr = sortByName(groups: newGroups)
        return tempr
    }
    
    func transferGroup(group: Group){
        self.data = addReceivedItemToHeaderSection(item: group)
        self.tableView.reloadData()
    }
}
