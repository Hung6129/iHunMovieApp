//
//  ViewController.swift
//  iHunMovieApp
//
//  Created by Hưng Nguyễn on 18/02/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let v1 = UINavigationController(rootViewController: HomeViewController())
        let v2 = UINavigationController(rootViewController: UpComingViewController())
        let v3 = UINavigationController(rootViewController: SearchViewController())
        let v4 = UINavigationController(rootViewController: DownloadViewController())
         
        v1.tabBarItem.image = UIImage(systemName: "house.fill")
        v2.tabBarItem.image = UIImage(systemName: "calendar.badge.clock")
        v3.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle.fill")
        v4.tabBarItem.image = UIImage(systemName: "arrow.down.square.fill")
        
        v1.title = "Home"
        v2.title = "Upcoming"
        v3.title = "Top Search"
        v4.title = "Download"
        
        tabBar.tintColor = .label
        setViewControllers([v1,v2,v3,v4], animated: true)
    }


}

