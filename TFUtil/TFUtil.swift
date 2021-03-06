//
//  TFUtil.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/8.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class TFUtil: NSObject {
    
    class var defaultManager: TFUtil {
        struct Static {
            static let utilManager = TFUtil()
        }
        return Static.utilManager
    }
    
    
   // MARK:  颜色转换 IOS中十六进制的颜色转换为UIColor
   
    func colorWithHexString(_ hexString: String) -> UIColor{
        var cString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {return UIColor.black}
        if cString.hasPrefix("0X") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 2))}
        if cString.hasPrefix("#") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))}
        if cString.characters.count != 6 {return UIColor.black}
        
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
    
}
