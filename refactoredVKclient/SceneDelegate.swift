//
//  SceneDelegate.swift
//  refactoredVKclient
//
//  Created by mac on 10.07.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        if windowScene == scene as? UIWindowScene {

                        let window = UIWindow(windowScene: windowScene)
                        let navController = UINavigationController()
                        let viewController = ViewController()

                        navController.viewControllers = [viewController]
                        window.rootViewController = navController
                        self.window = window
                        window.makeKeyAndVisible()
                }
    }

}

