//
//  TFNetImageViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/9.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class TFNetImageViewController: TFBaseViewController, UITableViewDataSource, UITableViewDelegate{

    var TFTableView:UITableView!
    var titleItemArray = ["姓名","账号","爱好","职业","年薪"]
    // "http://hangge.com/blog/images/logo.png",
    var imageUrlArray =  ["http://d.lanrentuku.com/down/png/1706/10avatars-material-pngs/avatars-material-man-4.png",
                         "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "http://image.nationalgeographic.com.cn/2015/0121/20150121033625957.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-3.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-4.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-5.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-6.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-7.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-8.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-9.jpg",
                            //"http://hangge.com/blog/images/logo.png",
                            "http://image.nationalgeographic.com.cn/2015/0121/20150121033625957.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0703/20170703042329843.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "http://image.nationalgeographic.com.cn/2015/0121/20150121033625957.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "http://pica.nipic.com/2007-12-12/20071212235955316_2.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-3.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-4.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-5.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-6.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-7.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-8.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-9.jpg",
                            "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-10.jpg",
                            "http://d.lanrentuku.com/down/png/1706/10avatars-material-pngs/avatars-material-man-4.png",
                            "http://d.lanrentuku.com/down/png/1706/10avatars-material-pngs/avatars-material-man-4.png",
                            "http://image.nationalgeographic.com.cn/2015/0121/20150121033625957.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0703/20170703042329843.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg",
                            "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTopNavBarTitle("download Demo")
        self.setTopNavBackButton()
        self.view.backgroundColor = UIColor.lightGray
        self.creatTable()
    }
    
    func creatTable(){

        TFTableView = UITableView(frame: CGRect(x: 0, y: 64, width: AppWidth, height: AppHeight - 64),style:UITableViewStyle.grouped);
        TFTableView.delegate = self;
        TFTableView.dataSource = self;
        self.view.addSubview(TFTableView);
        
        //TFTableView.register(TFNetImageTableViewCell.self, forCellReuseIdentifier: "identtifier")
        TFTableView.register(LJNetImageCell.self, forCellReuseIdentifier: "identtifier")
    }
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return imageUrlArray.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
            return 80;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        //let cellIdentifier : String = "identtifier"
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TFNetImageTableViewCell
        //cell 重用
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! LJNetImageCell
        
        //cell 不重用
        let cell = LJNetImageCell()
        
        //let urlStr = "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg"
        //let urlStr = "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg"
        
         //let urlStr = "http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg"
        //cell.setCellData((titleItemArray[indexPath.row] as NSString) as String , imageUrlStr: imageUrlArray[indexPath.row])
        
        cell.setCellData("pic", imageUrlStr: imageUrlArray[indexPath.row])
 
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true);
        
        /*
         打印json数据
         */
        LJDownLoadNetImage.request("GET", url: "http://jsonplaceholder.typicode.com/users/1") { (data, respond, error) in
            
            let str = String(data:data!, encoding: String.Encoding.utf8)!
            print(str)

        }
    }
 }
