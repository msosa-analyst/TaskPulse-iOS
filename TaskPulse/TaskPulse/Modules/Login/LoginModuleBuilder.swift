//
//  LoginModuleBuilder.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class LoginModuleBuilder {
    
    private init() {}
    
    static func build(navigationController: UINavigationController?) -> LoginViewController {
        let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
        let router = LoginRouter(navigationController: navigationController)
        let viewModel: LoginViewModelProtocol = LoginViewModel(router: router)
        
        let viewController = storyboard.instantiateViewController(identifier: "LoginViewController") { coder in
            return LoginViewController(coder: coder, viewModel: viewModel)
        }
        
        return viewController
    }
}
