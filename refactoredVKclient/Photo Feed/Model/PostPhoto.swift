//
//  PostPhoto.swift
//  refactoredVKclient
//
//  Created by mac on 12.08.2021.
//

import Foundation
import SwiftyJSON

struct PostPhoto: Decodable {
    let photo: String
    let likes: Int
    init(json: SwiftyJSON.JSON) {
        let sizes = json["sizes"].arrayValue
        let sizesArray = sizes[sizes.count - 1]
        self.photo = sizesArray["url"].stringValue
        self.likes = json["likes"]["count"].intValue
    }
}
