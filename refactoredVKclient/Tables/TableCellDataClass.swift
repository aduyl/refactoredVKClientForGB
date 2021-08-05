//
//  TableCellDataClass.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import Foundation
import UIKit

class tableCellData{
    var avatar: UIImage?
    var name: String?
    var itemProreties: String? // for user -- age, for group -- description
    var usersPhotos: [UIImage]?
    
    init(avatar: UIImage, name: String, itemPropeties: String,usersPhotos: [UIImage]) {
        self.avatar = avatar
        self.name = name
        self.itemProreties = itemPropeties
        self.usersPhotos = usersPhotos
        //super.init()
    }
    
    var tableCellDataClass: tableCellData?
}

class usersGroup {
    var usersGroup: [tableCellData]?
    
    init(usersGroup: [tableCellData]) {
        self.usersGroup = usersGroup
    }
    var saveGroups: usersGroup?
}