//
//  RootViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/2/22.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit

class LJTestViewController:TFBaseViewController, DetailViewControllerDelegate {
    var dataSource = NSMutableArray()
    var currentIndexPath:IndexPath?
    var ljTableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTopNavBarTitle("LJTestViewController")
        self.setTopNavBackButton()
        
        for index in 0...12 {
            let model = UserModel(userName: "name:\(index + 1)",
                userID: index, phone: "13877747982", email: "632840804@qq.com")
            dataSource.add(model)
        }
        
        self.createTableView()
    }
    
    func createTableView(){
        ljTableView = UITableView(frame: CGRect(x:0 ,y:64, width:Int(SCREEN_WIDTH), height:48*dataSource.count ), style: UITableViewStyle.plain)
        ljTableView?.backgroundColor = UIColor.gray
        ljTableView?.dataSource = self
        ljTableView?.delegate = self
        self.view.addSubview(ljTableView!)
    }
    
    func changeItem(forUserModel userModel: UserModel?) {

        for m in 0 ..< dataSource.count {
            //let model = dataSource[index] as? UserModel
            let model = dataSource[m] as? UserModel
            if model!.userID == userModel!.userID {
                model!.phone = userModel!.phone
                model!.email = userModel!.email
                ljTableView?.reloadRows(at: [currentIndexPath!], with: UITableViewRowAnimation.fade)
                break
            }
        }
    }
}

//MARK: -- UITableViewDelegate
extension LJTestViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int  {
        return dataSource.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 48
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier: String = "UserInfoCellIdentifier"
        var cell: UserInfoCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? UserInfoCell
        
        if cell == nil {
            cell = UserInfoCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        let model: UserModel? = dataSource[indexPath.row] as? UserModel
        cell!.configureCell(model)
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = LJTestDetailViewController()
        detail.userModel = dataSource[indexPath.row] as? UserModel
        detail.delegate = self
        currentIndexPath = indexPath
        self.navigationController!.pushViewController(detail, animated: true)
    }
}
