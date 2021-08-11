//
//  UsersGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 16.07.2021.
//

import UIKit

class UsersGroupController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate {
    let usersTableView = UITableView()
    var dataArray: [GroupsHeaderSection]
    var searchBar = UISearchBar()
    // MARK: initialization
    
    init() {
        self.dataArray = []
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
    
    func configureNavigation() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.9), y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    func configureTableView(){
        self.view.backgroundColor = .white
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
        usersTableView.frame = CGRect(x: 0, y: 74, width: view.bounds.width, height: view.bounds.height - 74)
        usersTableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "GroupCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.dataArray[section]
        return section.tableCell.count
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataArray[indexPath.section].tableCell.remove(at: indexPath.row)
        if dataArray[indexPath.section].tableCell.count == 0 {
            dataArray.remove(at: indexPath.section)
        }
        self.usersTableView.reloadData()
    }
    
    @objc func pushNvigationButton(){
        let groupController = GlobalGroupController()
        groupController.delegate = self
        navigationController?.pushViewController(groupController, animated: true)
        
    }
}
extension UsersGroupController: DataDelegate {
    func addReceivedItemToHeaderSectionArray(item: Groups) -> [GroupsHeaderSection]{
        var newArray: [Groups] = []
        for headerItem in dataArray{
            for tableCellItem in headerItem.tableCell {
                if item.name == tableCellItem.name {
                    return dataArray
                }
                newArray.append(tableCellItem)
            }
        }
        newArray.append(item)
        let tempr = sortByName(groupsArray: newArray)
        return tempr
    }
    
    func transferGroup(group: Groups){
        self.dataArray = addReceivedItemToHeaderSectionArray(item: group)
        self.usersTableView.reloadData()
    }
}
