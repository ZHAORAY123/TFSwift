//
//  LJNetImageViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/5.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit
import ImageIO

class LJNetImageViewController: TFBaseViewController {
    
    var progressView : UIProgressView?
    var progressValue : Float = 0.0
    var ljImageView : UIImageView?
    var ljDownLoadManage : LJSessionRequestManager?

    var imageUrlArray = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(/*indexPath.row +*/ 2).jpg",
        "http://image.nationalgeographic.com.cn/2015/0121/20150121033625957.jpg",
        "http://image.nationalgeographic.com.cn/2017/0703/20170703042329843.jpg",
        "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg",
        "http://image.nationalgeographic.com.cn/2017/0702/20170702124619643.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTopNavBarTitle("图片下载")
        self.setTopNavBackButton()
        
        self.createDownLoadBtn()
        self.createProgessView()
        self.createImageView()
    }
    
//MARK: --  UI
    func createDownLoadBtn() {
        let downLoadBtn = UIButton(frame: CGRect(x: (SCREEN_WIDTH - 100)/2.0, y: 120, width: 100, height: 40))
        downLoadBtn .setTitle("down load", for: UIControlState())
        downLoadBtn .addTarget(self, action: #selector(LJNetImageViewController.btnClicked(_:)), for: UIControlEvents.touchUpInside)
        downLoadBtn.backgroundColor = UIColor.gray
        self.view.addSubview(downLoadBtn)
    }
//MARK: 进度条
    func createProgessView() {
        progressView = UIProgressView.init(progressViewStyle: .default)
        progressView?.frame = CGRect(x: 0, y: 65, width: SCREEN_WIDTH, height: 1)
        progressView?.progressTintColor = UIColor.red
        progressView?.trackTintColor = UIColor.black
        self.view.addSubview(progressView!)
    }
    
    func createImageView(){
        ljImageView = UIImageView(frame: CGRect(x: (SCREEN_WIDTH - 200)/2.0, y: 180, width: 200, height: 200))
        self.view.addSubview(ljImageView!)
    }
    
    func loadNetImage() {
        ljDownLoadManage = LJSessionRequestManager()
        /*ljDownLoadManage?.sessoinDownload(imageUrlArray[1], "GET", { (data, progressValue ,error) in

            weak var weakSelf : LJNetImageViewController? = self  //等同与上面的表达式
            DispatchQueue.main.async {
                weakSelf?.progressView?.setProgress(progressValue, animated: true)
                print("------进度打印:\(progressValue)")
                
                if error == nil, data != nil{
                    let image = UIImage(data: data!)
                    weakSelf?.ljImageView?.image = image
                }
            }
        })*/
        
        LJSessionRequestManager.shared.retrieveImage(imageUrlArray[1], "GET", { (data, progressValue ,error) in
            
            weak var weakSelf : LJNetImageViewController? = self  //等同与上面的表达式
            DispatchQueue.main.async {
                weakSelf?.progressView?.setProgress(progressValue, animated: true)
                print("------进度打印:\(progressValue)")
                
                if error == nil, data != nil{
                    let image = UIImage(data: data!)
                    weakSelf?.ljImageView?.image = image
                }
            }
        })
    }

    func btnClicked(_ sender: UIButton)
    {
        //progressValue = progressValue + 0.1
        //progressView?.setProgress(progressValue, animated: true)
        
        self.loadNetImage()
    }
}
