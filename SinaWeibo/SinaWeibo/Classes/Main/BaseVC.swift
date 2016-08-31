//
//  BaseVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/25.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class BaseVC: UITableViewController,VisitorViewDelegate {

    // 是否已登录
    var isLogin = false
    
    // 访客界面
    var visitorView:VisitorView?
    
    // 加载视图
    override func loadView() {
        
        // 根据是否登录 加载界面
        isLogin ? super.loadView() : loadVisitorView()
        
    }
    
    // 加载访客界面
    func loadVisitorView() {
        
        let visitorView = VisitorView()
        visitorView.delegate = self
        self.view = visitorView
        self.visitorView = visitorView
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(self.wbRegister))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(self.wbLogin))
    }
    
    // 登录
    func wbLogin() {
        let nav = UINavigationController(rootViewController: OAuthVC())
        self.present(nav, animated: true, completion: nil)
    }
    
    // 注册
    func wbRegister() {
        UserAccount().loadAccount()
        print(#function)
        
    }

}
