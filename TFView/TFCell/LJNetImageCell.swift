//
//  LJNetImageCell.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/4.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit

class LJNetImageCell: UITableViewCell
{
    var titleImage : UIImageView!
    var titleLabel : UILabel!
    
    var LJTask : LJSessionRequestManager?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.creatCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatCell()
    {
        //设置label
        titleLabel = UILabel(frame: CGRect(x: 100, y: (80 - 14)/2.0, width: 40, height: 14))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.contentView.addSubview(titleLabel)
    }
   
//方法一： 利用Opration来下载数据
    
    func setCellData(_ labelNameStr:String,  imageUrlStr:String)
    {
        titleLabel.text = labelNameStr as String
        /* Session 的delegate模式下载图片或者数据*/
         LJWebImageManager.shared.retrieveImage(imageUrlStr, { (data, error) in
            
            if error == nil, data != nil {
                let newImage = UIImage(data: data! as Data)
                
                DispatchQueue.main.async{
                    let  titleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
                    titleImage.image = newImage
                    self.contentView.addSubview(titleImage)
                }
            }
            else
            {
                print(error ?? "")
            }
        })
    }

//方法二： 利用delete来下载数据
/*
    func setCellData(_ labelNameStr:String,  imageUrlStr:String)
    {
        titleLabel.text = labelNameStr as String

        /* Session 的delegate模式下载图片或者数据*/
        LJTask = LJSessionRequestManager()
        LJTask?.retrieveImage(imageUrlStr,"GET",{ (data ,progressValue, error)in
            
            //此处如果data有值的话，才去初始化image
                if error == nil, data != nil {
                    let newImage = UIImage(data: data! as Data)
                    
                    DispatchQueue.main.async{
                        let  titleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
                        titleImage.image = newImage
                        self.contentView.addSubview(titleImage)
                    }
                }
                else
                {
                    print(error ?? "")
                }
        })
    }*/
}
