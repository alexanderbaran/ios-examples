//
//  TabBarController.swift
//  tab-navigation
//
//  Created by Alexander Baran on 29/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit

// If you have several UITabBarController in your app, you sould name this one something like MainTabBarController.
class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        
        let tabBarImageSize = CGSize(width: 30, height: 30)
        
        let homeController = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: homeController)
        homeNavigationController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .newspaperO, textColor: .gray, size: tabBarImageSize)
        homeNavigationController.tabBarItem.selectedImage = UIImage.fontAwesomeIcon(name: .newspaperO, textColor: .blue, size: tabBarImageSize)
        // If you set tabBarItem.title in the UIViewController then don't put it in viewDidLoad, because it will only be set when it is loaded. Set it in init instead.
        homeNavigationController.tabBarItem.title = "Home"
        
        let searchController = SearchController()
        searchController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .search, textColor: .gray, size: tabBarImageSize)
        searchController.tabBarItem.selectedImage = UIImage.fontAwesomeIcon(name: .search, textColor: .blue, size: tabBarImageSize)
        searchController.tabBarItem.title = "Search"
        
        let messagesController = MessagesController()
        messagesController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .commentO, textColor: .gray, size: tabBarImageSize)
        messagesController.tabBarItem.selectedImage = UIImage.fontAwesomeIcon(name: .commentO, textColor: .blue, size: tabBarImageSize)
        messagesController.tabBarItem.title = "Messages"
        
        let notificationsController = NotificationsController()
        notificationsController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .bellO, textColor: .gray, size: tabBarImageSize)
        notificationsController.tabBarItem.selectedImage = UIImage.fontAwesomeIcon(name: .bellO, textColor: .blue, size: tabBarImageSize)
        notificationsController.tabBarItem.title = "Notifications"
        
        let settingsController = SettingsController()
        settingsController.tabBarItem.image = UIImage.fontAwesomeIcon(name: .gear, textColor: .gray, size: tabBarImageSize)
        settingsController.tabBarItem.selectedImage = UIImage.fontAwesomeIcon(name: .gear, textColor: .blue, size: tabBarImageSize)
        settingsController.tabBarItem.title = "Settings"
        
//        tabBar.tintColor = .black
//        tabBar.tintColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
//        tabBar.unselectedItemTintColor = .lightGray
        
        viewControllers = [homeNavigationController, searchController, messagesController, notificationsController, settingsController]
        
        /* This is not well documented in Apple docs. Have to do it after we set up all of the controllers inside of array as above. */
        // Modify tab bar item insets.
//        guard let items = tabBar.items else { return }
//        for item in items {
//            // Adding a negative value to the opposite direction to fix the aspect ratio.
//            item.imageInsets = UIEdgeInsets(top: -2, left: 0, bottom: 2, right: 0)
//        }
    }
    
}
