//
//  SecondViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class SecondViewController: TFBaseViewController, UIActionSheetDelegate {

    var progressView:UIProgressView!
    var tfArray:NSArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        self.setTopNavBarTitle("购物")
        
        let button = UIButton(frame: CGRect(x: 15, y: 70, width: 100, height: 40))
        button .setTitle("打电话", for: UIControlState())
        button .addTarget(self, action: #selector(SecondViewController.btnClicked(_:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.lightText
        self.view.addSubview(button)
        
        self.testUIProgressView()
    }
    
    
    func btnClicked(_ sender: UIButton)
    {
        //自动打开拨号页面并自动拨打电话
        //UIApplication.sharedApplication().openURL(NSURL(string: "tel://10086")!)
        
       // self.testUIActionSheet()
        
       // self.testUISlider()
        
       //  progressView.setProgress(0.8, animated: true)
        
        self.testSaveArrayPlist()
        
       // self.testSaveDicPlist()
    }
    
    //底部警告框
    func testUIActionSheet()
    {
       let actionSheet = UIActionSheet()
        actionSheet.addButton(withTitle: "取消")
        actionSheet.addButton(withTitle: "确定")
        actionSheet.addButton(withTitle: "选择")
        actionSheet.cancelButtonIndex = 0
        actionSheet.delegate = self
        actionSheet.show(in: self.view)
    }
    
    //MARK:UIActionSheetDelegate
    func actionSheet(_ actionSheet: UIActionSheet, didDismissWithButtonIndex buttonIndex: Int){
        
      print("您点击了："+actionSheet.buttonTitle(at: buttonIndex)!)
        
    }
    
    //MARK:滑块
    func testUISlider()
    {
        let slider = UISlider(frame: CGRect(x: 0, y: 70, width: 300,height: 40))
        slider.center = self.view.center
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.isContinuous=false  //滑块滑动停止后才触发ValueChanged事件
        slider.addTarget(self, action: #selector(SecondViewController.valuechage(_:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(slider)
    }
    
    func valuechage(_ sender: UISlider)
    {
       print(sender.value)
    }
    
    //MARK:进度条
    func testUIProgressView()
    {
        progressView = UIProgressView(progressViewStyle:.default)
        progressView.center = self.view.center
        progressView.progress = 0.5
        progressView.progressTintColor = UIColor.gray//已有进度颜色
        progressView.trackTintColor = UIColor.green//剩余进度颜色（即进度槽颜色
        self.view.addSubview(progressView)
    }
    
    //MARK:1，数组（Array）的存储和读取
    func testSaveArrayPlist() {
        let arry = NSArray(objects: "stev","baidu.com","com","12344","robinson")
        let filePath:String = NSHomeDirectory() + "/Documents/tf.plist"
        arry.write(toFile: filePath, atomically: true)
        
        tfArray = NSArray(contentsOfFile:NSHomeDirectory() + "/Documents/tf.plist")
        
        print(tfArray ?? "sww")
    }
    
    func testSaveDicPlist(){
        let  myArray = [
            
            [
                ["name":"小明" , "url":"google.com"],
                ["name":"张三", "url":"tf234.com"],
                ["name":"里斯" , "url":"csdn.com"]
            ],
            
            [
                ["name":"张三", "url":"tf234.com"],
                ["name":"里斯" , "url":"csdn.com"]
            ]
        ]
        
        let filePath:String = NSHomeDirectory() + "/Documents/tfDic.plist"
        NSArray(array: myArray).write(toFile: filePath, atomically: true)
        print(filePath)
        
        tfArray = NSArray(contentsOfFile:NSHomeDirectory() + "/Documents/tfDic.plist")
        
        print(tfArray ?? "sww")
    }
    
    func testNotificationCenter()  {
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.loadImage(_:)), name: NSNotification.Name(rawValue: "loadImageNotification"), object: nil)
    }
    
    func loadImage(_ notification:Notification)
    {
        let userInfo = notification.userInfo
        let value1 = userInfo!["value1"]
        let  value2 = userInfo!["value2"]
        
        print("获取到通知，用户数据是[(\(String(describing: value1)),\(String(describing: value2))]")
        sleep(3)
        print("执行完毕")
    }
}
