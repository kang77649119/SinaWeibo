//
//  UserAccount.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/31.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {

    // 用户授权的唯一票据
    var access_token:String?
    
    // access_token的生命周期
    var expires_in:NSNumber?
    
    // 授权用户的UID
    var uid:String?
    
    // 字典转模型
    static func initWithDict(dict:NSDictionary) -> UserAccount {
        let obj = UserAccount()
        obj.setValuesForKeys(dict as! [String : Any])
        return obj
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    // 归档
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(expires_in, forKey: "expires_in")
        aCoder.encode(uid, forKey: "uid")
        
    }
    
    override init() {
        super.init()
    }
    
    // 解档
    public required init?(coder aDecoder: NSCoder){
        self.access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        self.expires_in = aDecoder.decodeObject(forKey: "expires_in") as? NSNumber
        self.uid = aDecoder.decodeObject(forKey: "uid") as? String
    }
    
    // 保存数据
    func saveAccount() {
        
        let path = NSString(string: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!)
        let filePath = path.appendingPathComponent("account.plist")
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
        
    }
    
    // 读取数据
    func loadAccount() -> UserAccount? {
        
        let path = NSString(string: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!)
        let filePath = path.appendingPathComponent("account.plist")
        return NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? UserAccount
        
    }
    
    
}
