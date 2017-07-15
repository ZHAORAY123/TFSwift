//
//  LJWebImageManager.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/8.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation

class LJWebImageManager: NSObject {
    
    /// Shared manager used .
    public static let shared = LJWebImageManager()
    public var ljquee  =  OperationQueue()
    
    override init() {
        if #available(iOS 8.0, *) {
            self.ljquee.qualityOfService = .background
        } else {
        }
    }
   
   public func retrieveImage(_ ljurl: String, _ ljcallback: @escaping OpreationClosure){
        
        if ljurl != "" {
            
            if LJFileManager.shared.readFileFromCache(ljurl) != nil {
                //将接收的数据结果回调到前台，用于进度展示
                print("获取的是Disk缓存数据哦完毕")
                ljcallback(LJFileManager.shared.readFileFromCache(ljurl) as! Data,nil)
            }
            //首先取缓存数据，没取到的话，直接下载
           else if LJCacheDataManage.shared.getMemoryCache(ljurl) != nil {
                //将接收的数据结果回调到前台，用于进度展示
                print("获取的是Memory缓存数据哦完毕")
                ljcallback(LJCacheDataManage.shared.getMemoryCache(ljurl)  ,nil)
            }
            else
            {
               _  = self.requestWebByUrl(ljurl, ljcallback)
            }
        }
    }
   public func requestWebByUrl(_ url: String,_ callback: @escaping OpreationClosure) -> LJOpreationManager {
        let operation = LJOpreationManager().initWitParamter(url, callback)
        ljquee.addOperation(operation)
        
        return operation
    }
}
