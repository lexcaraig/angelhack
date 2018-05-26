//
//  LoginCoordinator.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation

import UIKit

public final class LoginCoordinator: AbstractCoordinator {
    
    // MARK: Delegate Properties
    //    private unowned let delegate: MainCoordinatorDelegate
    
    // MARK: Initializers
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    // MARK: Stored Properties
    private let navigationController: UINavigationController
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: LoginVC = LoginVC(delegate: self)
        self.navigationController.pushViewController(vc, animated: false)
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.delegate = self
    }
}

extension LoginCoordinator: LoginVCDelegate {
    public func loginTapped() {
        self.navigationController.navigationBar.isHidden = false
        let mainCoordinator: MainCoordinator = MainCoordinator(
            navigationController: self.navigationController
        )
        mainCoordinator.start()
        self.add(childCoordinator: mainCoordinator)
    }
}

// MARK: - UINavigationControllerDelegate Protocol
extension LoginCoordinator: UINavigationControllerDelegate {
    
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
