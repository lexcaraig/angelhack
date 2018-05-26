//
//  LoginVC.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

class LoginVC: JAViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: LoginVCDelegate
    
    public init(delegate: LoginVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTargetActions(with: [
                self.rootView.loginButton: #selector(LoginVC.loginAction)
            ]
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Views
private extension LoginVC {
    unowned var rootView: LoginView { return self.view as! LoginView } // swiftlint:disable:this force_cast
}

// MARK: - Target Actions
private extension LoginVC {    
    @objc func loginAction() {
        self.delegate.loginTapped()
    }
}

