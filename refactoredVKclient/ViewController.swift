//
//  ViewController.swift
//  refactoredVKclient
//
//  Created by mac on 10.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var vkWebView: WKWebView! {
        didSet{
            vkWebView.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        sentRequest()
    }
    
    func sentRequest() {
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
        vkWebView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        let paramss = fragment.components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in
                        var dict = result
                        let key = param[0]
                        let value = param[1]
                        dict[key] = value
                        return dict
                }
        let token = paramss["access_token"]
        if let token = token {
            Session.instance.token = token
            let friendsQueryItems = ["fields":"domain,sex,bdate,city"]
            let photoQueryItems = ["extended": "1", "photo_sizes":"1"]
            let groupsQueryItems = ["extended": "1"]
            let sortedGroupsQueryItems = ["extended": "1", "filter": "admin"]
            
            print(requests(token: token,
                                  method: "friends.get",
                                  queryItems: friendsQueryItems))
            print(requests(token: token,
                                  method: "photos.getAll",
                                  queryItems: photoQueryItems))
            print(requests(token: token,
                                  method: "groups.get",
                                  queryItems: groupsQueryItems))
            print(requests(token: token,
                                  method: "groups.get",
                                  queryItems: sortedGroupsQueryItems))
        }
        decisionHandler(.cancel)
        performTabBarController()
        return
    }
    
    func requests(token: String, method: String, queryItems: [String: String]) {
        var URLComponents = URLComponents()
        URLComponents.scheme = "https"
        URLComponents.host = "api.vk.com"
        URLComponents.path = "/method/" + method
        URLComponents.queryItems = [
            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name: "v", value: "5.68"),
        ]
        
        for item in queryItems {
            let query = URLQueryItem(name: item.key, value: item.value)
            URLComponents.queryItems?.append(query)
        }
        
        guard let url = URLComponents.url else { return }
        let dataTest = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                } catch  {
                    print(error)
                }
            }
        }
        dataTest.resume()
    }
    
    func performTabBarController() {
        let tabbarController = TabBarController()
        navigationController?.pushViewController(tabbarController, animated: true)
    }
}
