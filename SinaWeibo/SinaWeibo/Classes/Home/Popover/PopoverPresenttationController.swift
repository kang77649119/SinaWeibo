//
//  PopoverPresenttationController.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/29.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class PopoverPresenttationController: UIPresentationController {
    
    // 菜单尺寸
    var popoverFrame:CGRect = CGRect.zero

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    // 背景遮罩层
    lazy var coverView : UIView = {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissCoverView)))
        return view
        
    }()
    
    // 容器布局
    override func containerViewWillLayoutSubviews() {
        
        // 弹出的视图 presentedView
        // 容器 containerView(菜单的尺寸，也可以在外面设置，如果没有设置则显示默认大小)
        if self.popoverFrame == .zero {
            self.presentedView!.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        } else {
            self.presentedView!.frame = self.popoverFrame
        }
        
        self.containerView!.insertSubview(self.coverView, at: 0)
    }
    
    // 取消弹出菜单
    func dismissCoverView() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    
}
