//
//  UsersGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 16.07.2021.
//

import UIKit

class UsersGroupController: ViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate{
    let usersTableView = UITableView()
    var dataArray = [HeaderSection]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
        configureTableView()
    }
    
    func configureTableView(){
        self.view.backgroundColor = .white
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(74)).isActive = true
        usersTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        usersTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        usersTableView.register(UniversalTableViewCell.self, forCellReuseIdentifier: "groupCell")
    }
    
    func configureNavigation() {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 30, width: CGFloat(Double(self.view.frame.width) * 0.9), height: 44))
        view.addSubview(searchBar)
        let navButton = UIButton(frame: CGRect(x: CGFloat(Double(self.view.frame.width) * 0.9), y:30, width: CGFloat(Double(self.view.frame.width) * 0.1), height: 44))
        navButton.setImage(UIImage(systemName: "plus"), for: .normal)
        navButton.addTarget(nil, action: #selector(pushNvigationButton), for: .touchUpInside)
        view.addSubview(navButton)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.dataArray[section]
        return section.tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! UniversalTableViewCell
        cell.group = dataArray[indexPath.section].tableCell[indexPath.row]
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
        dataArray.remove(at: indexPath.row)
        self.usersTableView.reloadData()
    }
    
    @objc func pushNvigationButton(){
        let groupController = GlobalGroupController(configureWithNavigation: true)
        groupController.delegate = self
        navigationController?.pushViewController(groupController, animated: true)
        
    }
}
extension UsersGroupController: DataDelegate {
    func addReceivedItemToHeaderSectionArray(item: tableCellData) -> [HeaderSection]{
        var newArray: [tableCellData] = []
        for headerItem in dataArray{
            for tableCellItem in headerItem.tableCell {
                if item.name == tableCellItem.name {
                    return dataArray
                }
                newArray.append(tableCellItem)
            }
        }
        newArray.append(item)
        let tempr = sortByName(array: newArray)
        return tempr
    }
    
    func transferGroup(group: tableCellData){
        self.dataArray = addReceivedItemToHeaderSectionArray(item: group)
        self.usersTableView.reloadData()
        print("\(self.dataArray.first?.tableCell.first!.name)")
    }
}
