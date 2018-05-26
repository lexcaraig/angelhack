//
//  MainCoordinator.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit

public final class MainCoordinator: AbstractCoordinator {
    
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
    private var vc: MainVC!
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        self.navigationController.navigationItem.hidesBackButton = true
        
        let vc: MainVC = MainVC(delegate: self)
        self.vc = vc
        self.navigationController.pushViewController(
            vc,
            animated: true
        )
    }
}

extension MainCoordinator: MainVCDelegate {
    public func logoutTapped() {
        
    }
    
    public func selected() {
        let detailCoordinator: DetailCoordinator = DetailCoordinator(
            navigationController: self.navigationController
        )
        
        detailCoordinator.start()
        self.add(childCoordinator: detailCoordinator)
        
        self.navigationController.delegate = self
    }
}

// MARK: - UINavigationControllerDelegate Protocol
extension MainCoordinator: UINavigationControllerDelegate {
    
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(
            forKey: UITransitionContextViewControllerKey.from),
            !navigationController.viewControllers.contains(fromViewController)
            else { return }
        
        guard let coordinator = self.childCoordinators.first
            else { return }
        
        self.remove(childCoordinator: coordinator)
        self.navigationController.delegate = self
    }
}

extension MainCoordinator: LoginVCDelegate {
    public func loginTapped() {}
}
