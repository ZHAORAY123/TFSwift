//
//  TFTabBar.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

public let tabItem_width: CGFloat = 49.0
public let AppWidth: CGFloat = UIScreen.main.bounds.size.width
public let AppHeight: CGFloat = UIScreen.main.bounds.size.height
public let tabItemSpace_Width = (AppWidth-4*tabItem_width)/5

import UIKit


class TFTabBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: AppHeight-49, width: AppWidth, height: 49))
        
       //self  = CGRectMake(0, AppHeight-49, AppWidth, 49)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    
    func setTabBarFrame()
    {
        
    
    }

}
