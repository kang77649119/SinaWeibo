//
//  MeVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/23.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class MeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !isLogin {
            self.visitorView!.setupVisitorInfo(isHome: false, iconName: "visitordiscover_image_profile", message: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
