//
//  UsersGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 16.07.2021.
//

import UIKit

class UsersGroupController: UniversalTableController{

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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataArray[indexPath.section].tableCell.remove(at: indexPath.row)
        if dataArray[indexPath.section].tableCell.count == 0 {
            dataArray.remove(at: indexPath.section)
        }
        self.usersTableView.reloadData()
    }
    
    @objc override func pushNvigationButton(){
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
