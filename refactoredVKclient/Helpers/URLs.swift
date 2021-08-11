//
//  URLs.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation


class URLs {
    static func getFriendURLs() -> URL{
        var URLComponents = URLComponents()
        URLComponents.scheme = "https"
        URLComponents.host = "api.vk.com"
        URLComponents.path = "/method/friends.get"
        URLComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        if let url = URLComponents.url {
            return url
        }
        let ur = URLComponents.url!
        return ur
    }
    static func getGroupURLs() -> URL{
        var URLComponents = URLComponents()
        URLComponents.scheme = "https"
        URLComponents.host = "api.vk.com"
        URLComponents.path = "/method/groups.get"
        URLComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        if let url = URLComponents.url {
            return url
        }
        let ur = URLComponents.url!
        return ur
    }

}

