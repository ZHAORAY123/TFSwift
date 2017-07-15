//
//  ThirdViewController.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/5/5.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import UIKit

class ThirdViewController: TFBaseViewController {

    var LJTableView:UITableView!
    var ljArray  = ["TFNetImageViewController","LJNetImageViewController","LJTestViewController"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        self.setTopNavBarTitle("demo数据测试")
        self.createTableView()
    }
    
    func createTableView(){
        LJTableView = UITableView(frame: CGRect(x:0, y:64, width: Int(SCREEN_WIDTH), height: 48*ljArray.count), style:UITableViewStyle.plain)
        LJTableView.backgroundColor = UIColor.gray
        LJTableView.dataSource = self
        LJTableView.delegate = self
        self.view.addSubview(LJTableView)
        
        LJTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ljCell")
    }
}

extension ThirdViewController:UITableViewDataSource,UITableViewDelegate
{
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ljArray.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let identifier : String = "ljCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        cell?.textLabel?.text = ljArray[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 48
    }
    
    // Called after the user changes the selection.
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let classStr :String = ljArray[indexPath.row]
        let vc : UIViewController = self.getVCByClassString(classStr)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: -- 根据类文件字符串转换为ViewController
extension ThirdViewController
{
     /// 类文件字符串转换为ViewController
     /// - Parameter childControllerName: VC的字符串
     /// - Returns: ViewController
     func getVCByClassString(_ childControllerName: String) -> UIViewController?{
        
             // 1.获取命名空间
             // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
             guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                     print("命名空间不存在")
                     return nil
                 }
             // 2.通过命名空间和类名转换成类
             let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
        
             // swift 中通过Class创建一个对象,必须告诉系统Class的类型
             guard let clsType = cls as? UIViewController.Type else {
                     print("无法转换成UIViewController")
                     return nil
                 }
             // 3.通过Class创建对象
             let childController = clsType.init()
        
             return childController
         }
}
