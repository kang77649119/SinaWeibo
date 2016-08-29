//
//  VisitorView.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/25.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate : NSObjectProtocol {
    
    // 登录
    func wbLogin()
    
    // 注册
    func wbRegister()
    
}

class VisitorView: UIView {
    
    // 避免循环引用 声明为弱引用
    weak var delegate:VisitorViewDelegate?

    // 转盘
    lazy var iconView:UIImageView = {
    
        let imgView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return imgView
        
    }()
    
    // 图标
    lazy var homeIcon:UIImageView = {
        
        let imgView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return imgView
        
    }()
    
    // 文本
    lazy var messageLabel:UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.text = "新浪"
        return label
        
    }()
    
    // 登陆按钮
    lazy var loginBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitle("登陆", for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        btn.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        
        return btn
        
    }()
    
    // 注册按钮
    lazy var registerBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.setTitle("注册", for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        btn.addTarget(self, action: #selector(self.register), for: .touchUpInside)
        btn.sizeToFit()
        return btn
        
    }()
    
    // 遮罩
    lazy var maskBGView : UIImageView = {
       
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        // 添加控件
        setupUI()
    }
    
    // 添加控件
    func setupUI() {
        
        self.backgroundColor = UIColor.white
        self.addSubview(self.iconView)
        self.addSubview(self.maskBGView)
        self.addSubview(self.homeIcon)
        self.addSubview(self.messageLabel)
        self.addSubview(self.loginBtn)
        self.addSubview(self.registerBtn)
        
    }
    
    // 登录
    func login() {
        print(#function)
        self.delegate?.wbLogin()
        
    }
    
    // 注册
    func register() {
        print(#function)
        self.delegate?.wbRegister()
    }
    
    // 设置访客信息
    func setupVisitorInfo(isHome:Bool, iconName:String, message:String) {
        
        if !isHome {
            self.iconView.isHidden = true
        } else {
            startAnimate()
        }
        
        self.homeIcon.image = UIImage(named: iconName)
        self.messageLabel.text = message
        
    }
    
    // 转盘动画
    func startAnimate() {
     
        let animate = CABasicAnimation(keyPath: "transform.rotation")
        animate.toValue = 2 * M_PI
        animate.duration = 20
        animate.repeatCount = MAXFLOAT
        animate.isRemovedOnCompletion = false
        self.iconView.layer.add(animate, forKey: nil)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.iconView.xmg_AlignInner(type: .Center, referView: self, size: nil)
        self.homeIcon.xmg_AlignInner(type: .Center, referView: self, size: nil)
        self.messageLabel.xmg_AlignVertical(type: .BottomCenter, referView: self.iconView, size: nil)
        let widthCons = NSLayoutConstraint(item: self.messageLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224)
        self.addConstraint(widthCons)
        self.registerBtn.xmg_AlignVertical(type: .BottomLeft, referView: self.messageLabel, size: CGSize(width: 100, height: 30) , offset: CGPoint(x: 0, y: 20))
        self.loginBtn.xmg_AlignVertical(type: .BottomRight, referView: self.messageLabel, size: CGSize(width: 100, height: 30) , offset: CGPoint(x: 0, y: 20))
        self.maskBGView.xmg_Fill(referView: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
