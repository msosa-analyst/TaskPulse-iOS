//
//  SignUpModuleBuilder.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 17/11/26.
//

import UIKit

class SignUpModuleBuilder{
    
    private init() {}
    
    static func build(navigationController: UINavigationController?) -> SignUpViewController {
        
        let router = SignUpRouter(navigationController: navigationController)
        
        let viewModel = SignUpViewModel(router: router)
        
        let viewController = SignUpViewController(viewModel: viewModel)
        
        return viewController
    }
}
