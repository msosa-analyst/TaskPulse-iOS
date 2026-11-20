//
//  LoginRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class LoginRouter: LoginRouterProtocol {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigateToCreateAccount() {
        let signUpVC = SignUpModuleBuilder.build(navigationController: navigationController)
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func navigateToHome() {
        let homeVC = UIViewController()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = .systemRed
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
