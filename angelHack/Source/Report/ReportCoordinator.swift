//
//  ReportCoordinator.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

public final class ReportCoordinator: AbstractCoordinator {
    
    // MARK: Delegate Properties
    //    private unowned let delegate: MainCoordinatorDelegate
    
    // MARK: Initializers
    public init(navigationController: UINavigationController) {
        //        self.delegate = delegate
        self.navigationController = navigationController
        super.init()
    }
    
    // MARK: Stored Properties
    private let navigationController: UINavigationController
    private var vc: ReportVC!
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: ReportVC = ReportVC(delegate: self)
        self.vc = vc
        self.navigationController.present(vc, animated: true, completion: nil)
    }
}

extension ReportCoordinator: ReportVCDelegate {
    public func closeTapped() {
        self.remove(childCoordinator: self)
        vc.dismiss(animated: true, completion: nil)
    }
}
