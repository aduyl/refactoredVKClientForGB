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
        let news = NewsFeedController()
        let groups = UsersGroupController()
        let frirnds = FriendsController()
        
        let newsIcon = UITabBarItem(title: "News", image: UIImage(systemName: "list.bullet.rectangle"), selectedImage: UIImage(systemName: "list.bullet.rectangle"))
        let groupIcon = UITabBarItem(title: "Group", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3"))
        let friendsIcon = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2"))
        
        news.tabBarItem = newsIcon
        groups.tabBarItem = groupIcon
        frirnds.tabBarItem = friendsIcon
        
        let controllers = [news, groups, frirnds]
        self.viewControllers = controllers
    }
}
