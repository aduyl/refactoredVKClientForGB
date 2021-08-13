//
//  Groups.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import SwiftyJSON

struct Groups: Codable {
    // group picture
    var avatar: String
    // group name
    var name: String
    // group description
    var description: String
    init(json: SwiftyJSON.JSON) {
        self.avatar = json["photo_100"].stringValue
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
    }
    
}
