//
//  LJSessionRequestManager.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/4.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit

public typealias SwiftClosure = ((_ data:Data? , _ progressValue:Float, _ error: Error?) -> Void)

class LJSessionRequestManager: NSObject{
    
    //单例
    public static let shared = LJSessionRequestManager()
    
    /**
     *  下载用的url
     */
    public var ljimageUrl : String?
    /**
     *  定义闭包属性,可选类型
     */
    public  var callBackClosure : SwiftClosure?
    
    func retrieveImage(_ ljurl: String, _ method : String , _ ljcallback: @escaping SwiftClosure){
        
        if ljurl != "" {
            //首先取缓存数据，没取到的话，直接下载
            if LJCacheDataManage.shared.getMemoryCache(ljurl) != nil {
                //将接收的数据结果回调到前台，用于进度展示
                print("获取的是缓存数据哦完毕")
                ljcallback(LJCacheDataManage.shared.getMemoryCache(ljurl) ,1.0 ,nil)
            }
            else
            {
                self.sessoinDownload(ljurl, method, ljcallback)
            }
        }
    }

    open  func sessoinDownload(_ url: String, _ method : String , _ callback: @escaping SwiftClosure)
    {
        callBackClosure = callback
        
        //1、创建URL下载地址
        let url:URL! = URL(string:url);
        
        //2、创建Request对象
        var urlRequest:URLRequest = URLRequest(url:url);
        urlRequest.httpMethod = method
        urlRequest.httpShouldUsePipelining = true;
        
        //不需要缓存
        //urlRequest.cachePolicy = .reloadIgnoringLocalCacheData
        
        //3、创建会话
        let config = URLSessionConfiguration.default
        let session  = URLSession(configuration: config, delegate:self, delegateQueue: .main)

        //4、下载任务  
        //1>-- URLSessionDownloadDelegate 模式
        //let loadDataTask = session.downloadTask(with: urlRequest)
        //2>-- -- URLSessionDataDelegate 模式
        let loadDataTask = session.dataTask(with: urlRequest)
        
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
}

// MARK -  URLSessionDataDelegate 模式获取数据
extension LJSessionRequestManager:URLSessionDataDelegate
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
        print("Data......\(data)")
        self.responseData.append(data)
        
        let  currentBytes :Float = Float(self.responseData.length)
        let  allTotalBytes :Float = Float((dataTask.response?.expectedContentLength)!)
        
        let proValu :Float = Float(currentBytes/allTotalBytes)
        print("URLSessionDataDelegate----下载进度:------\(proValu*100)%");
       
        /*
        if callBackClosure != nil ,((dataTask.response?.expectedContentLength) != nil)
        {
            //避免循环引用，weak当对象销毁的时候，对象会被指定为nil
            //weak var weakSelf = self //对象推到，省略了ViewController
            weak var weakSelf : LJSessionRequestManager? = self  //等同与上面的表达式
            
            DispatchQueue.main.async
                {
                    //将接收的数据结果回调到前台，用于进度展示
                    print("URLSessionDataDelegate----数据边下载边加载")
                    
                    //增量下载网络图片，下载一点图片data，展示一点图片
                    (weakSelf?.callBackClosure!(weakSelf?.responseData as! Data,proValu ,nil))!
                }
        }*/
    }
    
     func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
    {
        if callBackClosure != nil ,let data = self.responseData{
            
            weak var weakSelf : LJSessionRequestManager? = self
            DispatchQueue.main.async
            {
                    print("URLSessionDataDelegate----数据下载完毕")
                   LJCacheDataManage.shared.setMemoryCache((task.currentRequest?.url?.absoluteString)!,data as Data)
                
                    //将接收的数据结果回调到前台，用于进度展示
                    weakSelf?.callBackClosure!(data as Data ,1.0 ,nil)
            }
        }
    }
}

/*
// MARK -  URLSessionDownloadDelegate 模式获取数据
extension LJSessionRequestManager:URLSessionDownloadDelegate{
    
    //下载进度
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let  currentBytes :CGFloat = CGFloat(totalBytesWritten)
        let  allTotalBytes :CGFloat = CGFloat(totalBytesExpectedToWrite)
        
        //获取进度
        let proValue :Float = (Float)(currentBytes/allTotalBytes)
        print("URLSessionDownloadDelegate----下载进度:------\(proValue*100)%");
        
        weak var weakSelf : LJSessionRequestManager? = self
        DispatchQueue.main.async
            {
                //将接收的数据结果回调到前台，用于进度展示
                weakSelf?.callBackClosure!(nil ,proValue ,nil)
        }
    }
    
    //下载偏移
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        //主要用于暂停续传
    }
    
    //下载结束
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        //根据下载存储的location位置来获取data数据
        let data = (try? Data(contentsOf: URL(fileURLWithPath: location.path)))
        if callBackClosure != nil ,let data = data{
            
            weak var weakSelf : LJSessionRequestManager? = self
            DispatchQueue.main.async
                {
                    //将接收的数据结果回调到前台，用于进度展示
                    weakSelf?.callBackClosure!(data ,1.0 ,nil)
            }
        }
        /*  保存到相册
         UIImage * image = [UIImage imageWithData:data];
         UIImageWriteToSavedPhotosAlbum(image, nil,nil,nil);
         */
    }
    
//    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
//    {
//        if error != nil  {
//            callBackClosure!(nil , 0, error)
//        }
//          print("URLSessionDownloadDelegate----数据下载完毕")
//    }

} */

