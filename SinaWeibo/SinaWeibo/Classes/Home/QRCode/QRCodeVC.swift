//
//  QRCodeVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/29.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class QRCodeVC: UIViewController {
    
    
    @IBOutlet weak var qrcodeTabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 默认选中二维码
        self.qrcodeTabBar.selectedItem = self.qrcodeTabBar.items![0]
    }

    // 关闭
    @IBAction func close(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
