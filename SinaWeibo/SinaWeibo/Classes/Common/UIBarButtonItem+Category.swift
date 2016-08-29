//
//  UIBarButtonItem+Category.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/26.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    // 创建导航栏按钮
    class func createBarButtonItem(imageName:String,target:Any?, action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: .normal)
        btn.setImage(UIImage(named:imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
        
    }
    
}
