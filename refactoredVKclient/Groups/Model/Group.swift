//
//  Groups.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Group: Object, Decodable {
    /// group picture
    @objc dynamic var avatar: String
    /// group name
    @objc dynamic var name: String
    /// group description
    @objc dynamic var groupDescription: String
    
     convenience init(json: SwiftyJSON.JSON) {
        self.init()
        self.avatar = json["photo_100"].stringValue
        self.name = json["name"].stringValue
        self.groupDescription = json["description"].stringValue
    }
    
}
