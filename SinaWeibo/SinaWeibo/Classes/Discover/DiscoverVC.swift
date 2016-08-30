//
//  DiscoverVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/23.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class DiscoverVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        if !isLogin {
            self.visitorView!.setupVisitorInfo(isHome: false, iconName: "visitordiscover_image_message", message: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
