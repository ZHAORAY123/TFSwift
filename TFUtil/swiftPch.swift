//
//  swiftPch.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/5.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//
/*
    7.11日更新日记
    LJOpreationManager，和LJSessionRequestManager添加了内存缓存
    
    7.15 更新日记
    文件缓存添加
 */

import Foundation
import UIKit

// 屏幕的宽
let SCREEN_WIDTH = UIScreen.main.bounds.width

// 屏幕的高
let SCREEN_HEIGHT = UIScreen.main.bounds.height

//判断iPhone4
let IPHONE4_DEV:Bool! = (UIScreen.main.bounds.size.height == 480) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (UIScreen.main.bounds.size.height == 568) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (UIScreen.main.bounds.size.height == 667) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (UIScreen.main.bounds.size.height > 667) ? true : false

//判断iPad
let IPAD_DEV:Bool! = (UIDevice.current.userInterfaceIdiom == .pad) ? true : false
