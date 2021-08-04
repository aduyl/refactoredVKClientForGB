//
//  FriendsController.swift
//  refactoredVKclient
//
//  Created by mac on 12.07.2021.
//

import UIKit
import Foundation

class FriendsController: UniversalTableController {
    override func getDataArray() {
        self.dataArray = TableCellDataAPI.getUsersCellData()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        let userPosts = FriendPageController(user: dataArray[indexPath.section].tableCell[indexPath.row])
        let userPosts = FriendPhotoFeedController(user: dataArray[indexPath.section].tableCell[indexPath.row])
        self.navigationController?.pushViewController(userPosts, animated: true)
        return indexPath
    }
}
