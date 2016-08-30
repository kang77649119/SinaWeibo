//
//  PopoverAnimator.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/29.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

// 由于转场动画与HomeVC的关联性小，不需要写在同一个文件中，所以把跟转场动画相关的代码抽出到一个单独的类中
// 只要实现了代理方法，转场的所有事情都需要由程序员来完成
class PopoverAnimator: NSObject, UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    // 是否已展开菜单
    var isPresent:Bool = false
    
    // 菜单尺寸
    var popoverFrame:CGRect = CGRect.zero
    
    // 设置转场
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let popover = PopoverPresenttationController(presentedViewController: presented, presenting: presenting)
        popover.popoverFrame = self.popoverFrame
        return popover
    }
    
    // 告诉系统谁来负责Modal的展现动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // 标记是否已展开菜单
        self.isPresent = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: PopoverWillShow), object: nil)
        return self
    }
    
    // 告诉系统谁来负责Modal的消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.isPresent = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: PopoverWillDismiss), object: nil)
        return self
    }
    
    // 动画时长
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    // 设置动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if self.isPresent {
            
            let toView = transitionContext.view(forKey: .to)
            toView?.transform = CGAffineTransform(scaleX: 1, y: 0)
            
            // 一定要将视图添加到容器上
            transitionContext.containerView.addSubview(toView!)
            
            // 设置锚点(默认y是0.5，设置为0才会由上至下展现视图)
            toView!.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            // 动画时长使用上面的协议方法(为了统一)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView?.transform = .identity
            }) { (_) in
                // 动画执行完毕，一定要告诉系统
                transitionContext.completeTransition(true)
            }
            
        } else {
            
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                // 由于CGFloat值不准确，设置为0后没有动画执行，所以设置y为很小的值，动画才会执行
                fromView?.transform = CGAffineTransform(scaleX: 1, y: 0.00000001)
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
            })
            
        }
        
    }
    
}
