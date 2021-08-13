//
//  Users.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation
import SwiftyJSON

struct Users: Codable {
    let bdate: String?
    let firstName: String
    let lastName: String
    let photo100: String
    let id: Int
    
    init(json: SwiftyJSON.JSON) {
        self.id = json["id"].intValue
        self.bdate = json["bdate"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo100 = json["photo_100"].stringValue
    }
}
