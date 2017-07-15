//
//  UserModel.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/2/22.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import Foundation


open class UserModel : NSObject {
    var userName: String     ///< store user's name, optional
    var userID: Int          ///< store user's ID
    var phone: String?       ///< store user's telephone number
    var email: String?       ///< store user's email
    var responseData = NSMutableData()
    var ljArray = Array<Any>()
    
    
    // designated initializer
    init(userName: String, userID: Int, phone: String?, email: String?) {
        self.userName = userName
        self.userID = userID
        self.phone = phone
        self.email = email
        
        super.init()
    }
    
    //带属性监视器的普通属性
    var age : Int = 0
    {
       //我们需要在age属性变化前做点什么
       willSet
       {
          //此处的newValue是将要给age赋予的新值
          print("newValue is:\(newValue)")
          print("age willSet changed:\(age)")
       }
       
       //我们需要在age属性发生变化后做点什么
       didSet
       {
           print("age didSet changed to:\(age)")
       }
    }
    
}
