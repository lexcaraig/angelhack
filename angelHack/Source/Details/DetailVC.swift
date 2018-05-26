//
//  DetailVC.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

class DetailVC: JAViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: DetailVCDelegate
    
    public init(delegate: DetailVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTargetActions(with: [
            self.rootView.reportButton: #selector(DetailVC.reportAction),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - Views
private extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView } // swiftlint:disable:this force_cast
}

// MARK: - Target Actions
private extension DetailVC {
    
    @objc func reportAction() {
        self.delegate.reportTapped()
    }
    
}