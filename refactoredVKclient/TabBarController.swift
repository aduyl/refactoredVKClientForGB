//
//  TabBarController.swift
//  refactoredVKclient
//
//  Created by mac on 12.07.2021.
//

import UIKit
import RealmSwift


final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    var saveData = SaveData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configure()
        saveData.getData()
    }
    
    private func configure() {
        let groups = UsersGroupController()
        let frirnds = FriendsController()
            let groupIcon = UITabBarItem(title: "Group", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3"))
            groups.tabBarItem = groupIcon

            let friendsIcon = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2"))
            frirnds.tabBarItem = friendsIcon

            let controllers = [groups, frirnds]
            self.viewControllers = controllers
    }
}
