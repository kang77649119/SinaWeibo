//
//  MainVCViewController.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/23.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    lazy var addBtn:UIButton = {
    
        let btn = UIButton()
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        btn.addTarget(self, action: #selector(self.publish), for: .touchUpInside)
        return btn
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加子控制器
        setChildControllers()
        
    }
    
    // 添加子控制器
    func setChildControllers() {
        
        setupChildController(childController: HomeVC(), title: "首页", icon: "tabbar_home")
        setupChildController(childController: MessageVC(), title: "消息", icon: "tabbar_message_center")
        setupChildController(childController: NullVC(), title: "", icon: "")
        setupChildController(childController: DiscoverVC(), title: "广场", icon: "tabbar_discover")
        setupChildController(childController: MeVC(), title: "我", icon: "tabbar_profile")
        
    }
    
    // 添加子控制器
    func setupChildController(childController:UIViewController,title:String,icon:String) {
        
        childController.title = title
        childController.tabBarItem.image = UIImage(named: icon)
        childController.tabBarItem.selectedImage = UIImage(named: String(format: "%@_highlighted", icon))
        self.addChildViewController(UINavigationController(rootViewController: childController))
        
    }
    
    func publish() {
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.addSubview(self.addBtn)
        let tabBarF = self.tabBar.frame
        let tabBarW = tabBarF.width / CGFloat(self.childViewControllers.count)
        let tabBarH = tabBarF.height
        self.addBtn.frame = CGRect(x: 0, y: 0, width: tabBarW, height: tabBarH)
        self.addBtn.center = self.tabBar.center
        
    }

}
