//
//  NetWorkTools.swift
//  SinaWeibo
//
//  Created by 也许、 on 16/8/31.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit
import AFNetworking

class NetWorkTools: AFHTTPSessionManager {
    
    static let netWorkTools:NetWorkTools = {
        let obj = NetWorkTools(baseURL: URL(string: BaseUrl))
        // 微博的数据类型是text/plain，AFN默认是不支持的，所以需要添加进去
        obj.responseSerializer.acceptableContentTypes = Set(arrayLiteral: "application/json", "text/json", "text/javascript", "text/plain")
        return obj
    }()
    
    static func shareNetWorkTools() -> NetWorkTools {
        return netWorkTools
    }

}
