//
//  SignUpRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

class SignUpRouter: SignUpRouterProtocol {

    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func backToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
