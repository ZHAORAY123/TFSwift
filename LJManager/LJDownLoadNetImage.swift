//
//  LJDownLoadNetImage.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/1.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation

class LJDownLoadNetImage: NSObject {

    static func request(_ method: String, url: String, callback: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = method
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            callback(data, response, error)
        })
        task.resume()
    }
    
    //闭包类型 （参数列表）->(返回值类型)
    func loadData(_ finishCallBack: @escaping (_ jsonData:String) -> ()) {
        //1. 发送异步网络请求
        //放在此处，可以不加@escaping
//         finishCallBack()
     
        if #available(iOS 8.0, *) {
            DispatchQueue.global().async { 
                print("发送异步网络请求")
                
                DispatchQueue.main.async(execute: {
                    
                    //放在此处必须要加@escaping
                    finishCallBack("jsonData")
                })
            }
        }
    }
}

/*
static func downImage(_ urlStr:String, callback: @escaping (_ data: Data?, _ error: Error?) -> Void){
    
    //        //创建URL对象
    //        let url = URL(string:"http://hangge.com/blog/images/logo.png")!
    //        //创建请求对象
    //        let request = URLRequest(url: url)
    
    let url = URL(string:urlStr)!
    //创建请求对象
    let request = URLRequest(url: url)
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request, completionHandler: {
        (data, response, error) -> Void in
        
        callback(data! as Data, error)
        //            if error != nil{
        //                print(error.debugDescription)
        //            }else{
        //                //将图片数据赋予UIImage
        //                //let img = UIImage(data:data!)
        //                //self.BgImageView.image = img
        //            }
    }) as URLSessionTask
    
    //使用resume方法启动任务
    dataTask.resume()
}
*/
