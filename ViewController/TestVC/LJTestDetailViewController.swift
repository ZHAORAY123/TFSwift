//
//  File.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/2/22.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit

// this delegate needs a @objc, because @optional is only for objective-c, not for swift
@objc protocol DetailViewControllerDelegate : NSObjectProtocol {
    @objc optional func changeItem(forUserModel userModel: UserModel?)
}

class LJTestDetailViewController : TFBaseViewController {
    var userModel: UserModel?
    var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTopNavBarTitle("DetailViewController")
        self.setTopNavBackButton()
        
        self.view.backgroundColor = UIColor.white
        self.title = userModel?.userName
        
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 300, height: 40))
        button.setTitle("change", for:UIControlState())
        button.backgroundColor = UIColor.red
        //button.addTarget(self, action: "onChangeButtonClick:", for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        // @name create UISlider
        let slider = UISlider(frame: CGRect(x: 30, y: 200 + 130, width: 200, height: 30))
//        slider.addTarget(self, action: "clickSlider:", for: .valueChanged)
//        slider.minimumValue = 17.0
//        slider.maximumValue = 36.0
        self.view.addSubview(slider)
    }


    func onChangeButtonClick(_ sender: UIButton!) {
        if (userModel != nil) {
            userModel!.userName = "ChangeName"
            userModel!.email = "robinson_911@163.com"
            // changeItem needs to add a ? to the end, before (), because
            // this function is optional
            // delegate? 表示可能没有代理，而changeItem?表示方法可能没有实现，这样写就算没有实现也没有问题
            delegate?.changeItem?(forUserModel: userModel)
            self.navigationController!.popViewController(animated: true)
        }
    }
    
    func clickSlider(_ sender: UISlider!)
    {
        print("UISlider Vaule: \(sender.value)")
        
        let alertView = UIAlertView()
        alertView.title = "系统提示"
        alertView.message = "您确定要离开hangge.com吗？"
        alertView.addButton(withTitle: "取消")
        alertView.addButton(withTitle: "确定")
        alertView.cancelButtonIndex=0
        alertView.delegate=self;
        alertView.show()
    }
    
    
    func alertView(_ alertView:UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if(buttonIndex==alertView.cancelButtonIndex){
            print("点击了取消")
        }
        else
        {
            print("点击了确认")
        }
    }
    
}

extension LJTestDetailViewController
{
//    func dicLetTest() {
//        //1.如何定义字典
//          //1> 定义不可变字典：使用let修饰
//        
//        let ab : Int = 10
//        
//        //编译器会根据[]中每一个元素（数组），还是健值队（字典）
//        
//        //写法一
//        let dict3 : Dictionary<String, Any> = ["sww": 123,"frg":"911"]
//        
//        //写法二
//        let dict2 = ["sww": 123,"frg":"911"] as [String : Any]
//        
//        //写法三，常用写法
//        let dict1 : [String: Any] = ["sww": 123,"frg":"911"]
//        print(dict1,dict2,dict3,ab)
//    }
//    
//    func dicVarTest() {
//        //2.如何定义字典
//        //1> 定义可变字典：使用var修饰
//        //写法一
//        var dictm = Dictionary(String,Any)()
//        //写法二
//        var dicm = [String : Any]
//        
//        print(dictm,dicm)
//        
//        //2> 对可变字典添加元素
//        dicm["name"] = "why" //没有oc中的setonjectle
//        //3》删除元素
//        dicm.removeValue(forKey:("name")
//        //4>查找元素
//        //dicm["age"]
//        
//        
//        //3.遍历
//        
//        for values in dictm.values
//        {
//          print(values)
//        }
//        
//        for key in dictm.keys
//        {
//            print(key)
//        }
//    }

  
}
