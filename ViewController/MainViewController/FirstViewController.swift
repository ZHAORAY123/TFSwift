//
//  FirstViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class FirstViewController: TFBaseViewController {

    var ljload :LJDownLoadNetImage?
    var possibleNumber : String?
    var ljTempModel :  UserModel?
    
    //MARK: 懒加载
    /*
     用到时再加载
     多次使用只加载一次
     */
    lazy var names :[String] = {
        let names = ["why", "lmj", "swd"]
        print("------")
        return names
    }()
    
    //方式一：仅仅创建button
    lazy var btn1:UIButton = UIButton()
    
    //方式二:可以设置更多btn的属性
    lazy var btn :UIButton = {
        let btn = UIButton()
        btn.setTitle("按钮", for: .normal)
        btn.setImage(UIImage(named:""), for: .normal)
        return btn
    }()
    
// MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.setTopNavBarTitle("首页")
        ljload = LJDownLoadNetImage()
        //self.initTestUI()
        //枚举测试
        //self.testEnum()
        self.testEnum1()
        //可选绑定
        self.optionBindParametersTest()
    }
}

extension FirstViewController
{
    // MARK: 网络图片
    func initTestUI()
    {
        let button = UIButton(frame: CGRect(x: 10, y: 240, width: 300, height: 40))
        button.setTitle("网络图片", for:UIControlState())
        button.backgroundColor = UIColor.red
        button.tag = 999
        button.addTarget(self, action: #selector(FirstViewController.buttonClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    
    func testEnum(){
        
        enum ServerResponse {
            case result(String, String)
            case failure(String)
        }
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("Out of cheese.")
        print(success,failure)
    }
    
    func testEnum1(){
        enum Locale {
            case none
            case base
            case language(String)
            // 判断是否是汉语
            var isChinese:Bool{
                if case Locale.language("chinese") = self {
                    return true
                }
                return false
            }
            // 是否是其他语言
            var isLanguage:Bool{
                if case .language = self {
                    return true
                }
                return false
            }
            var isBase: Bool {
                if case .base = self {
                    return true
                }
                return false
            }
            var isNone: Bool {
                if case .none = self {
                    return true
                }
                return false
            }
        }
        
        let locale = Locale.language("english")
        print("------\(locale)")
        print("-----\(locale.isChinese)")
    }
    
    //MARK: 点击事件
    func buttonClick(_ sender:UIButton)
    {
        //避免循环引用，weak当对象销毁的时候，对象会被指定为nil
        //weak var weakSelf = self //对象推到，省略了ViewController
        weak var weakSelf : FirstViewController? = self  //等同与上面的表达式
        
        ljload?.loadData({ (jsonData:String) in
            print("获取到的数据:\(jsonData)")
            
            //weakSelf?.view.backgroundColor = UIColor.red
        })
        print("----\(names.count)")
        //        print(name)
        //let vc = TFNetImageViewController()
        //let vc = LJNetImageViewController()
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func optionBindParametersTest()  {
        possibleNumber = "jd"
        //可选绑定成功，然后赋值
        if let possibleNumber :String = possibleNumber{
            print("\(possibleNumber) 可选绑定成功，然后赋值")
        }else{
            //绑定失败
            print("可选绑定失败\(String(describing: possibleNumber))")
        }
        
        ljTempModel = UserModel.init(userName: "sww", userID: 12, phone: "123", email: "deew")
        ljTempModel?.ljArray.append("sww")
        ljTempModel?.age = 10
        print("可选绑定前:\(ljTempModel?.ljArray)")
        
        //可选绑定成功，然后赋值
        if let modle : UserModel = ljTempModel{
            
            modle.ljArray.append("123")
            
            print("可选绑定后:\(String(describing: ljTempModel?.ljArray))")
            
            print("\(modle.ljArray)可选绑定成功，然后赋值")
            //此处modle 和ljTempModel有相同的内存地址空间，所以对modle添加“123”，就相当于对ljTempModel添加“123”，实际打印结果也是如此
        }else{
            //绑定失败
            print("可选绑定失败")
        }
    }
}
