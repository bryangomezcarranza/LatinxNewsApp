//
//  LNTabBarViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemRed
        UITabBar.appearance().backgroundColor = .systemBackground
        
        viewControllers = [createHomeVC(), createFavoritesVC()]
        
    }
    
    private func createHomeVC() -> UINavigationController {
        
        let homeVC = LNHomeViewController()
        homeVC.title = "News"
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    private func createFavoritesVC() -> UINavigationController {
        
        let favortiesVC = FavoritesViewController()
        favortiesVC.title = "Favorites"
        favortiesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favortiesVC)
    }

}
