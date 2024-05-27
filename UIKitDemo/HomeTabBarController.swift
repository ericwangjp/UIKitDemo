//
//  HomeTabBarController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建视图控制器
        let homeVC = HomeViewController()
        homeVC.view.backgroundColor = .white
        let homeTabBarItem = UITabBarItem(title: "首页", image: UIImage(systemName: "house"), tag: 0)
        homeVC.tabBarItem = homeTabBarItem
        
        
        let discoverVC = DiscoverViewController()
        discoverVC.view.backgroundColor = .white
        let discoverTabBarItem = UITabBarItem(title: "发现", image: UIImage(systemName: "paperplane"), tag: 1)
        discoverVC.tabBarItem = discoverTabBarItem
        
        let mineVC = MineViewController()
        mineVC.view.backgroundColor = .white
        let mineTabBarItem = UITabBarItem(title: "我的", image: UIImage(systemName: "person"), tag: 2)
        mineTabBarItem.badgeValue = "99+"
        mineVC.tabBarItem = mineTabBarItem

        // 包装在导航控制器中
        let firstNav = UINavigationController(rootViewController: homeVC)
        let secondNav = UINavigationController(rootViewController: discoverVC)
        let thirdNav = UINavigationController(rootViewController: mineVC)

        // 设置标签控制器的视图控制器
        self.viewControllers = [firstNav, secondNav, thirdNav]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
