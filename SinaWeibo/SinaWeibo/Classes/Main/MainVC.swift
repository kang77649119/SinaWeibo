//
//  MainVCViewController.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/23.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置文字颜色
        self.tabBar.tintColor = UIColor.orange
        
        // 添加子控制器
        setupChildController(childController: HomeVC(), title: "首页", icon: "tabbar_home")
        setupChildController(childController: HomeVC(), title: "消息", icon: "tabbar_message_center")
        setupChildController(childController: HomeVC(), title: "广场", icon: "tabbar_discover")
        setupChildController(childController: HomeVC(), title: "我", icon: "tabbar_profile")
        
    }
    
    // 添加子控制器
    func setupChildController(childController:UIViewController,title:String,icon:String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: icon)
        childController.tabBarItem.selectedImage = UIImage(named: String(format: "%@_highlighted", icon))
        self.addChildViewController(UINavigationController(rootViewController: childController))
        
    }

}
