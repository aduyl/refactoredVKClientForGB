//
//  PostPhoto.swift
//  refactoredVKclient
//
//  Created by mac on 12.08.2021.
//

import Foundation
import SwiftyJSON
import RealmSwift

class PostPhoto: Object, Decodable {
    /// user's photo
    @objc dynamic var photo: String
    /// the number of likes on the photo
    @objc dynamic var likes: Int
    
    convenience init(json: SwiftyJSON.JSON) {
        self.init()
        let sizes = json["sizes"].arrayValue
        let sizesItem = sizes[sizes.count - 1]
        self.photo = sizesItem["url"].stringValue
        self.likes = json["likes"]["count"].intValue
    }
}
