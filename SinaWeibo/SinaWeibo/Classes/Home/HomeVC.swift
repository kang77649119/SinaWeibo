//
//  HomeVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/23.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class HomeVC: BaseVC {
    
    lazy var popoverAnimator:PopoverAnimator = {
        
        let popoverW:CGFloat = 200
        let popoverX = UIScreen.main.bounds.size.width * 0.5 - popoverW * 0.5
        let obj = PopoverAnimator()
        obj.popoverFrame = CGRect(x: popoverX, y: 56, width: popoverW, height: 200)
        return obj
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 如果未登陆,设置访客界面信息
        if !isLogin {
            self.visitorView!.setupVisitorInfo(isHome: true, iconName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            
            return
        }
        
        // 设置导航栏
        setupNavigation()
        
        // 注册titleView的监听通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.titleViewChange), name: NSNotification.Name(rawValue: PopoverWillShow), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.titleViewChange), name: NSNotification.Name(rawValue: PopoverWillDismiss), object: nil)
        
    }
    
    // 设置导航栏
    func setupNavigation() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(self.friend))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(self.qrcode))
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("也许、", for: .normal)
        titleBtn.addTarget(self, action: #selector(self.titleViewClick(sender:)), for: .touchUpInside)
        self.navigationItem.titleView = titleBtn
        
    }
    
    func friend() {
        print(#function)
    }
    
    // 二维码
    func qrcode() {
        
        let qrcodeVC = UIStoryboard(name: "QRCodeVC", bundle: nil).instantiateInitialViewController()!
        self.present(qrcodeVC, animated: true, completion: nil)
        
    }

    // 点击标题弹出菜单
    func titleViewClick(sender:UIButton) {
    
        // 弹出菜单(自定义转场)
        let popoverVC = UIStoryboard(name: "PopoverVC", bundle: nil).instantiateViewController(withIdentifier: "PopoverVC")

        // 自定义转场必须实现协议
        popoverVC.transitioningDelegate = self.popoverAnimator
        popoverVC.modalPresentationStyle = .custom
        self.present(popoverVC, animated: true, completion: nil)
        
    }
    
    // titleView箭头方向
    func titleViewChange() {
        let titleView = self.navigationItem.titleView as! TitleButton
        titleView.isSelected = !titleView.isSelected
    }
    
    deinit {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


