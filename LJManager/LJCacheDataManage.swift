//
//  LJDataCacheManage.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/10.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation

class LJCacheDataManage: NSObject{
    
    //单例
    public static let shared = LJCacheDataManage()
    
   // public var diskCache =
    
    //缓存的数据
    public var memoryCache = Dictionary<String, Data>()
    
    //返回缓存的数据
    func getMemoryCache(_ urlStr : String) ->  Data? {
        
        print("返回缓存的数据------\(memoryCache[urlStr] ?? nil)")
        return (memoryCache[urlStr] ?? nil)
    }
    
    //设置缓存值
    func setMemoryCache(_ urlStr : String, _ data : Data){
        if urlStr != "", data != nil {
            memoryCache[urlStr] = data
        }
    }
}
