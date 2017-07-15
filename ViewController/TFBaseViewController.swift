//
//  TFBaseViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

/// 导航栏高度
public let NavigationH: CGFloat = 64

class TFBaseViewController: UIViewController
{
    var navigationView: UIView!
    var topBarlineView: UIView!
    var titleLable : UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationView = UIView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: NavigationH))
        navigationView.backgroundColor = TFUtil.defaultManager.colorWithHexString("F7F7F7")
        self.view.addSubview(navigationView)
        
        topBarlineView = UIView(frame: CGRect(x: 0, y: 63.5, width: AppWidth, height: 0.5))
        topBarlineView.backgroundColor =  TFUtil.defaultManager.colorWithHexString("dfdfdf")
        self.view.addSubview(topBarlineView)

    }
    
    func setTopNavBarTitle(_ title:NSString)
    {
        titleLable = UILabel(frame: CGRect(x: 0,y: 25,width: self.view.frame.size.width, height: 30))
        titleLable.text = title as String
        titleLable.textAlignment = NSTextAlignment.center
        titleLable.font=UIFont(name:"Thonburi",size:18)
        titleLable.backgroundColor = UIColor.clear
        self.navigationView.addSubview(titleLable);
    }
    
    
    //MARK:返回按钮
    func setTopNavBackButton()
    {
        let backButton = UIButton(frame: CGRect(x: 0, y: 12, width: 70, height: 44))
        backButton.addTarget(self, action: #selector(TFBaseViewController.backBtn(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(backButton)
        
       let arrowView=UIImageView(image:UIImage(named:"icon-driver-zhaohuo-back.png"))
       arrowView.frame=CGRect(x: 0, y: 12, width: 50, height: 35)
       backButton.addSubview(arrowView)
        
    }
    
    //MARK:点击事件
    func backBtn(_ sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)

    }
}
