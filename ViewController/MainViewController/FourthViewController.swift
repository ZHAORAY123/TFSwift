//
//  FourthViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

/*
 1>internal :内部的，
     1.默认情况下所有的类的属性&方法的访问权限都是internal
     2.若本模块（项目/包/target）中可以访问
 2> private:私有的
     1.只有在本类中可以访问
 3> open 公开的
     1.可以跨模块（包/target）都是可以访问的
 4> fileprivate  swift3.0
     1.只要在本文件中都是可以进行访问的
 */

class FourthViewController: TFBaseViewController {
    
    var name : String = ""
    private var age : Int = 0
    fileprivate var height : Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        //1>internal :内部的，访问name,
        name = "srfg"
        print(name)
        
        //2> private:私有的,访问age
        age = 10
        print(age)
        
        
        //3> open 公开的,创建UIView对象
        let view = UIView()
        view.alpha = 0.5
        view.tag = 100
        view.frame = CGRect(x:0, y: 0 ,width: 100, height:100)
    }
}

class person {
    func test()  {
        let vc = FourthViewController()
        vc.name = "fgh"
        
//        2> private:私有的 //只有在本类中可以访问
//        vc.age =
        
//        4> fileprivate  swift3.0
//        1.只要在本文件中都是可以进行访问的
        vc.height = 1.00
    }
}


extension FourthViewController
{
    func setUI()
    {
        self.view.backgroundColor = UIColor.black
        self.setTopNavBarTitle("设置")
        
        let loginOutButton = UIButton(frame: CGRect(x: 10, y: 240, width: 300, height: 40))
        loginOutButton.setTitle("退出登录", for:UIControlState())
        loginOutButton.backgroundColor = UIColor.red
        loginOutButton.tag = 999
        loginOutButton.addTarget(self, action: #selector(FourthViewController.loginOutButtonClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginOutButton)
    }
    
    func loginOutButtonClick(_ sender:UIButton)
    {
        
        self.navigationController!.popToRootViewController(animated: false)
    }
}
