//
//  Users.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import SwiftyJSON
import RealmSwift


class User: Object, Decodable {
    /// birthday date
    @objc dynamic var bdate: String
    /// name
    @objc dynamic var firstName: String
    /// surmane
    @objc dynamic var lastName: String
    /// url of avatar image
    @objc dynamic var photo100: String
    /// user id
    @objc dynamic var userId: Int
    
    convenience init(json: SwiftyJSON.JSON) {
        self.init()
        self.userId = json["id"].intValue
        self.bdate = json["bdate"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo100 = json["photo_100"].stringValue
    }
}
