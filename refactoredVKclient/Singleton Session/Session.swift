//
//  Session.swift
//  refactoredVKclient
//
//  Created by mac on 04.08.2021.
//

import UIKit
class Session {
    static let instance = Session()
    
    private init() {}
    
    var fio: String = String()
    var userID: Int = 0
    var token = String()
}
