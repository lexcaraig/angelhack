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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ReportVC.rootViewTapped))
        self.rootView.addGestureRecognizer(tap)
        
        self.setUpTargetActions(with: [
                self.rootView.closeButton : #selector(ReportVC.closeAction),
                self.rootView.attachmentButton: #selector(ReportVC.attachmentAction),
                self.rootView.sendReportButton: #selector(ReportVC.sendReportAction)
            
            ]
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - Views
extension ReportVC {
    unowned var rootView: ReportView { return self.view as! ReportView } // swiftlint:disable:this force_cast
    
}

// MARK: - Target Actions
private extension ReportVC {
    
    @objc func closeAction() {        
        self.delegate.closeTapped()
    }
    
    @objc func attachmentAction() {
        self.delegate.attachmentTapped()
    }
    
    @objc func sendReportAction() {
        self.delegate.sendReport()
    }
    
    @objc func rootViewTapped() {
        self.rootView.descriptionTextView.resignFirstResponder()
    }
}

//extension ReportVC: UITextViewDelegate {
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if(text == "\n") {
//            textView.resignFirstResponder()
//            return false
//        }
//        return true
//    }
//}
