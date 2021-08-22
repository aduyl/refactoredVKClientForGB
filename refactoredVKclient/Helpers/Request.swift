//
//  Request.swift
//  refactoredVKclient
//
//  Created by mac on 10.08.2021.
//

import Foundation

class Request {
    static func sentRequest() -> URLRequest{
        var URLComponents = URLComponents()
        URLComponents.scheme = "https"
        URLComponents.host = "oauth.vk.com"
        URLComponents.path = "/authorize"
        URLComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7920321"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "friends"),
            URLQueryItem(name: "scope", value: "groups"),
            URLQueryItem(name: "scope", value: "photos"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: URLComponents.url!)
        return request
    }
}
