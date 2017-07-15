//
//  TFTabBarViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/7.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class TFTabBarViewController: UITabBarController {

    // MARK: life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadTabBarViewControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared .setStatusBarStyle(.lightContent, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidAppear(animated)
    }


    func loadTabBarViewControllers(){
        let firstVC  = FirstViewController ()
        let item1 : UITabBarItem = UITabBarItem (title: "首页", image: UIImage(named: "home_normal"), selectedImage: UIImage(named: "home_highlight"))
        firstVC.tabBarItem = item1
        firstVC.navigationItem.title = "首页"
        
        let secondVC = SecondViewController ()
        let item2 : UITabBarItem = UITabBarItem (title: "购物", image: UIImage(named: "message_normal"), selectedImage: UIImage(named: "message_highlight"))
        secondVC.tabBarItem = item2
        
        let thirdVC = ThirdViewController ()
        let item3 : UITabBarItem = UITabBarItem (title: "旅游", image: UIImage(named: "mycity_normal"), selectedImage: UIImage(named: "mycity_highlight"))
        thirdVC.tabBarItem = item3
        
        let fourthVC = FourthViewController ()
        let item4 : UITabBarItem = UITabBarItem (title: "设置", image: UIImage(named: "account_normal"), selectedImage: UIImage(named: "account_highlight"))
        fourthVC.tabBarItem = item4
        
        let tabArray = [firstVC ,secondVC ,thirdVC, fourthVC]
        self.viewControllers = tabArray
    }
}
