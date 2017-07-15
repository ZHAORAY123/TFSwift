//
//  UserInfoCell.swift
//  TFSwift
//
//  Created by 孙伟伟 on 16/2/22.
//  Copyright © 2016年 孙伟伟. All rights reserved.
//

import Foundation
import UIKit 

class UserInfoCell : UITableViewCell {
    var userNameLabel : UILabel!
    var phoneLabel : UILabel!
    var emailLabel : UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userNameLabel = UILabel(frame: CGRect(x: 30, y: 0, width: 100, height: 44))
        userNameLabel.backgroundColor = UIColor.clear
        userNameLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(userNameLabel)
        
        phoneLabel = UILabel(frame: CGRect(x: 120, y: 0, width: 200, height: 20))
        phoneLabel.backgroundColor = UIColor.clear
        phoneLabel.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(phoneLabel)
        
        emailLabel = UILabel(frame: CGRect(x: 120, y: 20, width: 200, height: 20))
        emailLabel.backgroundColor = UIColor.clear
        emailLabel.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(emailLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ userModel: UserModel?) {
        if let model = userModel {
            userNameLabel.text = model.userName
            phoneLabel.text = model.phone
            emailLabel.text = model.email
        }
    }
}
