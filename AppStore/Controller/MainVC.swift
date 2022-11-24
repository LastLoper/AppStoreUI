//
//  MainVC.swift
//  AppStore
//
//  Created by WalterCho on 2022/11/23.
//

import UIKit

class MainVC: UITabBarController {
    
    private lazy var todayVC: UIViewController = {
        let vc = TodayVC()
        let tabbarItem = UITabBarItem(
            title: "투데이",
            image: UIImage(systemName: "mail"),
            tag: 0
        )
        vc.tabBarItem = tabbarItem
        return vc
    }()
    
    private lazy var appVC: UIViewController = {
        let vc = UIViewController()
        let tabbarItem = UITabBarItem(
            title: "앱",
            image: UIImage(systemName: "square.stack.3d.up"),
            tag: 1
        )
        vc.tabBarItem = tabbarItem
        return vc
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [todayVC, appVC]
    }
}

