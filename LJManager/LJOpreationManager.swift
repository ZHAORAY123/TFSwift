//
//  LJOpreationManager.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/8.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit

public typealias OpreationClosure = ((_ data:Data? , _ error: Error?) -> Void)

class LJOpreationManager: Operation {
    
    var memoryCache = Dictionary<String, Any>()
    
    /**
     *  下载用的url
     */
    public var imageUrl : String?
    
    /**
     *  定义闭包属性,可选类型
     */
    public  var ljcallBackClosure : OpreationClosure?
    
    func initWitParamter(_ url: String, _ callback: @escaping OpreationClosure) -> LJOpreationManager {
        
        if url != ""
        {
            self.imageUrl = url
            self.ljcallBackClosure = callback
        }
        return self
    }
    
    //MARK: -- start
    override func start() {
           print("start ljManager method")
           self.startRequest()
    }
    
    func startRequest()
    {
        //1、创建URL下载地址
        let url:URL! = URL(string:self.imageUrl!);
        
        //2、创建Request对象
        var urlRequest:URLRequest = URLRequest(url:url);
        urlRequest.httpMethod = "GET"
        urlRequest.httpShouldUsePipelining = true;
        
        //不需要缓存
        //urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        
        //3、创建会话
        let config = URLSessionConfiguration.default
        let session  = URLSession(configuration: config, delegate:self, delegateQueue: .main)
        
        //4、下载任务
        //2>-- -- URLSessionDataDelegate 模式
        let  loadDataTask = session.dataTask(with: urlRequest)
        
        //5、启动任务
        loadDataTask.resume()
    }
    
    //初始化一个data，用来存储下载下来的数据
    private var _responseData: NSMutableData!
    var responseData: NSMutableData!{
        get{
            if _responseData == nil {
                _responseData = NSMutableData()
            }
            return _responseData
        }
        set{
            self._responseData = newValue
        }
    }
    
    //初始化一个data，用来存储下载下来的数据
    public var _ljCacheImageArray: NSMutableArray!
    var ljCacheImageArray: NSMutableArray!{
        get{
            if _ljCacheImageArray == nil {
                _ljCacheImageArray = NSMutableArray()
            }
            return _ljCacheImageArray
        }
        set{
            self._ljCacheImageArray = newValue
        }
    }
}

// MARK -  URLSessionDataDelegate 模式获取数据
extension LJOpreationManager:URLSessionDataDelegate
{
    @available(iOS 7.0, *)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Swift.Void)
    {
        //允许继续加载数据
        completionHandler(.allow)
    }
    
    @available(iOS 7.0, *)
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    {
        //每次获取的data在此拼装
        //print("Data......\(data)")
        self.responseData.append(data)
        
        let  currentBytes :Float = Float(self.responseData.length)
        let  allTotalBytes :Float = Float((dataTask.response?.expectedContentLength)!)
        
        let proValu :Float = Float(currentBytes/allTotalBytes)
        print("URLSessionDataDelegate----下载进度:------\(proValu*100)%");
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
    {
        if ljcallBackClosure != nil ,let data = self.responseData{
            weak var weakSelf : LJOpreationManager? = self
            DispatchQueue.main.async
            {
                print("URLSessionDataDelegate----数据下载完毕")
                
                LJCacheDataManage.shared.setMemoryCache((task.currentRequest?.url?.absoluteString)!,data as Data)
                
               let a =  LJFileManager.shared.writeFile((task.currentRequest?.url?.absoluteString)!,data as NSData)
                
                print("-----写入文件成功\(a)")
                
                //将接收的数据结果回调到前台，用于进度展示
                weakSelf?.ljcallBackClosure!(data as Data ,nil)
            }
        }
    }
}
