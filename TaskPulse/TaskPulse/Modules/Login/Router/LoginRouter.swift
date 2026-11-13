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
        let createAccountVC = UIViewController()
        createAccountVC.title = "Create Account"
        createAccountVC.view.backgroundColor = .systemBlue
        navigationController?.pushViewController(createAccountVC, animated: true)
    }
    
    func navigateToHome() {
        let homeVC = UIViewController()
        homeVC.title = "Home"
        homeVC.view.backgroundColor = .systemRed
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
