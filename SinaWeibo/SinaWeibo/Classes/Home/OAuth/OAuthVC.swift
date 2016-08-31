//
//  OAuthVC.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/31.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class OAuthVC: UIViewController,UIWebViewDelegate {
    
    var webView:UIWebView = {
        return UIWebView()
    }()
    
    override func loadView() {
        self.view = self.webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlStr = OAuthUrl + "?client_id=" + AppKey + "&redirect_uri=" + RedirectUrl
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        self.webView.delegate = self
        self.webView.loadRequest(request)

        // 导航栏信息由栈顶控制器来设置,当前控制器就是栈顶控制器
        self.navigationItem.title = "也许、微博"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(self.cancel))
        
    }
    
    // 取消OAuth登陆
    func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // webView的请求
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let requestUrl = request.url?.absoluteString
        
        // 如果请求地址不是回调页面地址的话，请求通过
        if !requestUrl!.hasPrefix(RedirectUrl) {
            return true
        }
        
        // 授权成功的话，请求地址会有code参数
        let param = request.url!.query!
        let codeStr = "code="
        if param.hasPrefix(codeStr) {
            
            let code = param.substring(from: codeStr.endIndex)
            // 请求accessToken
            loadAccessToken(code: code)
            
        }
        
        return false
        
    }
    
    // 请求AccessToken
    func loadAccessToken(code:String) {
        
        let params = ["client_id":AppKey, "client_secret":AppSecret, "grant_type":"authorization_code", "code":code, "redirect_uri":RedirectUrl]
        
        NetWorkTools.shareNetWorkTools().post(AccessToken, parameters: params, progress: { (_) in
            
            }, success: { (_, json) in
    
                let userAccount = UserAccount.initWithDict(dict: json as! NSDictionary)
                userAccount.saveAccount()
                
            }) { (_, error) in
                print(error)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
