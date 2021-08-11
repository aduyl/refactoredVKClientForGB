//
//  ViewController.swift
//  refactoredVKclient
//
//  Created by mac on 10.07.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    lazy var vkWebView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        vkWebView.navigationDelegate = self
        vkWebView.uiDelegate = self
        self.view.addSubview(vkWebView)
        vkWebView.frame = view.bounds
        vkWebView.load(Request.sentRequest())
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
        }
        decisionHandler(.cancel)
        self.performTabBarController()
    }
}

extension ViewController {
    func performTabBarController() {
        let tabbarController = TabBarController()
        navigationController?.pushViewController(tabbarController, animated: true)
    }
}
