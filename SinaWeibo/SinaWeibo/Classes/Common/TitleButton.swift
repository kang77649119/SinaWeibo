//
//  TitleButton.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/26.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setImage(UIImage(named:"navigationbar_arrow_down"), for: .normal)
        self.setImage(UIImage(named:"navigationbar_arrow_up"), for: .selected)
        self.setTitleColor(UIColor.darkGray, for: .normal)
        self.sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.frame.size.width > 100 {
            self.frame.size.width = 100
        }
        
        let navF = UINavigationController().navigationBar.frame
        self.center = CGPoint(x: navF.width * 0.5, y: navF.height * 0.5)
        self.titleLabel?.frame.origin.x = 0
        self.imageView?.frame.origin.x = self.titleLabel!.frame.size.width
        
    }

}
