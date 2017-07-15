//
//  TFNetImageTableViewCell.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/9.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class TFNetImageTableViewCell: UITableViewCell
{

    var titleImage : UIImageView!
    var titleLabel : UILabel!
    
    //var LJTask : LJSessionRequestManager?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.creatCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func creatCell()
    {
       //http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg

        //设置label
        titleLabel = UILabel(frame: CGRect(x: 60, y: 18, width: 40, height: 14))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        self.contentView.addSubview(titleLabel)
        
        /*
           1. 直接加载本地的图片
         */
        
        /*
        titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
        titleImage.image = UIImage(named: "unicorn.png")
        titleImage.backgroundColor = UIColor.red;
        self.contentView.addSubview(titleImage)
         */
        
        /*
           2. 加载网络图片
         */
        
        /*
        //定义NSURL对象
        let url = NSURL.init(string: "http://hangge.com/blog/images/logo.png")
        //从网络获取数据流
        let data = NSData(contentsOf: url! as URL)
        
        //此处如果data有值的话，才去初始化image
        if (data != nil) {
            //通过数据流初始化图片
            let newImage = UIImage(data: data! as Data)
            let  titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
            titleImage.image = newImage
            self.contentView.addSubview(titleImage)
        }
        else{
            /*
              直接加载本地的图片
             */
            titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
            titleImage.image = UIImage(named: "unicorn.png")
            titleImage.backgroundColor = UIColor.red;
            self.contentView.addSubview(titleImage)
        }
 */
    }
    
    func setCellData(_ labelNameStr:String,  imageUrlStr:String)
    {
       titleLabel.text = labelNameStr as String
        
        /*
         3. 利用封装的URLSession加载网络图片
         */
        
        /*
        LJDownLoadNetImage.request("GET", url: imageUrlStr) { (data, response, error) in
            
            //此处如果data有值的话，才去初始化image
            if (data != nil) {
                let newImage = UIImage(data: data! as Data)
                let  titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
                titleImage.image = newImage
                self.contentView.addSubview(titleImage)
            }
        }
 */
        /* delegate  来传值*/
        //LJTask = LJSessionRequestManager()
        LJSessionRequestManager.shared.retrieveImage(imageUrlStr,"GET",{ (data,progressValue,ages)in
        
            //print(names!,ages!)
            //此处如果data有值的话，才去初始化image
            
            DispatchQueue.main.async{
                if (data != nil) {
                    let newImage = UIImage(data: data! as Data)
                    let  titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
                    titleImage.image = newImage
                    self.contentView.addSubview(titleImage)
                }
            }
        })
        
        /*
        //定义NSURL对象
        let url = NSURL.init(string: imageUrlStr)
        //从网络获取数据流
        let data = NSData(contentsOf: url! as URL)
        
        //此处如果data有值的话，才去初始化image
        if (data != nil) {
            //通过数据流初始化图片
            let newImage = UIImage(data: data! as Data)
            let  titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
            titleImage.image = newImage
            self.contentView.addSubview(titleImage)
        }
        else{
            /*
             直接加载本地的图片
             */
            titleImage = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
            titleImage.image = UIImage(named: "unicorn.png")
            titleImage.backgroundColor = UIColor.red;
            self.contentView.addSubview(titleImage)
        }
 */
    }

}
