//
//  TFLoginViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/7.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit


class TFLoginViewController: TFBaseViewController {

    var userTextFeild : UITextField!
    var passWordTextFeild : UITextField!
    
    
    // MARK: life circle
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared .setStatusBarStyle(.lightContent, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.setTopNavBarTitle("登录")
        self.initLoginView()
    }
    
    // MARK: UI View
    func initLoginView()
    {
        userTextFeild = UITextField(frame: CGRect(x: 10, y: 80, width: 300, height: 40))
        userTextFeild.layer.borderColor = UIColor.gray.cgColor
        userTextFeild.layer.borderWidth = 0.5
        userTextFeild.placeholder = " 请输入用户名"
        self.view.addSubview(userTextFeild)
        
        passWordTextFeild = UITextField(frame: CGRect(x: 10, y: 140, width: 300, height: 40))
        passWordTextFeild.layer.borderColor = UIColor.gray.cgColor
        passWordTextFeild.layer.borderWidth = 0.5
        passWordTextFeild.placeholder = "请输入密码"
        self.view.addSubview(passWordTextFeild)
        
        let loginButton = UIButton(frame: CGRect(x: 10, y: 240, width: 300, height: 40))
        loginButton.setTitle("登录", for:UIControlState())
        loginButton.backgroundColor = UIColor.red
        loginButton.tag = 999
        loginButton.addTarget(self, action: #selector(TFLoginViewController.loginButtonClick(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginButton)
        
        userTextFeild.text = UserDefaults.standard.value(forKey: "userName") as! String!
        passWordTextFeild.text = UserDefaults.standard.value(forKey: "passWord") as! String!
        
        if userTextFeild.text == "Sww" && passWordTextFeild.text == "123456"
        {
            UserDefaults.standard.set(userTextFeild.text, forKey: "userName")
            UserDefaults.standard.set(passWordTextFeild.text, forKey: "passWord")
            UserDefaults.standard.synchronize()
            
            let rootVC = TFTabBarViewController()
            self.navigationController!.pushViewController(rootVC, animated: false)
        }
    }
    
    
    // MARK: 点击事件
    func loginButtonClick(_ sender: UIButton!)
    {
        print("UISlider Vaule: \(sender.tag)")
        
//        if userTextFeild.text == "Sww" && passWordTextFeild.text == "123456"
//        {
            UserDefaults.standard.set(userTextFeild.text, forKey: "userName")
            UserDefaults.standard.set(passWordTextFeild.text, forKey: "passWord")
            UserDefaults.standard.synchronize()
            
            let rootVC = TFTabBarViewController()
            self.navigationController!.pushViewController(rootVC, animated: false)
//        }
        
//        else
//        {
//           let alertView = UIAlertView()
//           alertView.title = "提示"
//           alertView.message = "账户或密码输入错误"
//           //alertView.addButtonWithTitle("我知道了")
//           alertView.addButton(withTitle: "确定")
//           alertView.cancelButtonIndex=0
//           alertView.delegate=self;
//           alertView.show()
//        }
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
