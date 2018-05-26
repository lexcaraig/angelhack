//
//  ReportVC.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio
import Firebase
import FirebaseDatabase

class ReportVC: JAViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: ReportVCDelegate
    
    public init(delegate: ReportVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = ReportView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference(withPath: "reports")
        
        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any)
        })

        self.setUpTargetActions(with: [
                self.rootView.closeButton : #selector(ReportVC.closeAction)
            ]
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Views
private extension ReportVC {
    unowned var rootView: ReportView { return self.view as! ReportView } // swiftlint:disable:this force_cast
}

// MARK: - Target Actions
private extension ReportVC {
    
    @objc func closeAction() {        
        self.delegate.closeTapped()
    }
}

