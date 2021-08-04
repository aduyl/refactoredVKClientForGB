//
//  TabBarController.swift
//  refactoredVKclient
//
//  Created by mac on 12.07.2021.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
           super.viewDidLoad()
           delegate = self
       }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        let groups = UsersGroupController(configureWithNavigation: true)
            let groupIcon = UITabBarItem(title: "Group", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3"))
            groups.tabBarItem = groupIcon
            let frirnds = FriendsController(configureWithNavigation: false)
            let friendsIcon = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2"))
            frirnds.tabBarItem = friendsIcon

            let controllers = [groups, frirnds]  //array of the root view controllers displayed by the tab bar interface
            self.viewControllers = controllers
        }

        //Delegate methods
//        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//            print("Should select viewController: \(viewController.title ?? "") ?")
//            return true;
//        }

}
