//
//  QRCodeVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/29.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class QRCodeVC: UIViewController,UITabBarDelegate {
    
    // 冲击波视图顶部约束
    @IBOutlet weak var scanLineCons: NSLayoutConstraint!
   
    // 扫描容器高度约束
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    
    // 冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    
    // 底部工具栏
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // 开始动画
        startAnimate()
        
    }
    
    // 开始动画
    func startAnimate() {
        
        // 设置冲击波的起点位置
        self.scanLineCons.constant = -self.containerHeightCons.constant
        self.scanLineView.layoutIfNeeded()
        
        UIView.animate(withDuration: 5) {
            
            UIView.setAnimationRepeatCount(MAXFLOAT)
            
            // 设置冲击波的高度等于容器的高度(从0到300)
            self.scanLineCons.constant = self.containerHeightCons.constant
            
            // 强制更新界面
            self.scanLineView.layoutIfNeeded()
            
        }
        
    }
    
    // 选择不同二维码模式
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag == 101 {
            
            print("二维码")
            self.containerHeightCons.constant = 300
            
        } else if item.tag == 102 {
            
            print("条形码")
            self.containerHeightCons.constant = 150
            
            // 停止动画,解决冲击波的起点位置问题(因为动画是重复的，即使容器高度变化了，但每次冲击波的高度还是以第一次的位置为起点)
            self.scanLineView.layer.removeAllAnimations()
            self.startAnimate()
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
