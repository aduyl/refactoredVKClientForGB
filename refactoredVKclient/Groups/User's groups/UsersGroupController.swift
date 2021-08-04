//
//  UsersGroupController.swift
//  refactoredVKclient
//
//  Created by mac on 16.07.2021.
//

import UIKit
import Foundation

class UsersGroupController: UniversalTableController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.usersTableView.reloadData()
    }
    @objc override func pushNvigationButton(){
        let groupController = GlobalGroupController(configureWithNavigation: true)
        groupController.delegate = self
        navigationController?.pushViewController(groupController, animated: true)
        
    }
    func addReceivedItemToHeaderSectionArray(item: tableCellDataClass) -> [headerSection]{
        var newArray: [tableCellDataClass] = []
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
}

extension UsersGroupController: DataDelegate {
    func transferGroup(group: tableCellDataClass){
        self.dataArray = addReceivedItemToHeaderSectionArray(item: group)
        print("\(self.dataArray.first?.tableCell.first!.name)")
    }
    
    
}
