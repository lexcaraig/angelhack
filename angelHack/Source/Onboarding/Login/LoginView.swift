//
//  LoginView.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit
import Kio

class LoginView: UIView {
    
    let userNameFied: UITextField = {
        let view: UITextField = UITextField()
        view.placeholder = "Username"
        view.layer.borderWidth = 1
        return view
    }()
    
    let passwordFied: UITextField = {
        let view: UITextField = UITextField()
        view.placeholder = "Password"
        view.isSecureTextEntry = true
        view.layer.borderWidth = 1
        return view
    }()
    
    public let loginButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Login", for: UIControlState.normal)
        view.setTitleColor(UIColor.white, for: UIControlState.normal)
        view.backgroundColor = UIColor.blue
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.rpd.subviews(forAutoLayout: [
                self.userNameFied, self.passwordFied,
                self.loginButton
            ]
        )
        
        self.userNameFied.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(100.0)
            make.width.equalTo(200.0)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
        }
        
        self.passwordFied.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.userNameFied.snp.bottom).offset(20.0)
            make.width.equalTo(200.0)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
        }
        
        self.loginButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.passwordFied.snp.bottom).offset(20.0)
            make.width.equalTo(200.0)
            make.height.equalTo(50.0)
            make.centerX.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
