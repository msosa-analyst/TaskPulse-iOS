//
//  SignUpRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

class SignUpRouter: SignUpRouterProtocol {
    
    private weak var navigationController: UINavigationController?
    private let onSignUpSuccess: (() -> Void)?
    
    init(navigationController: UINavigationController?, onSignUpSuccess: (() ->Void)? = nil) {
        self.navigationController = navigationController
        self.onSignUpSuccess = onSignUpSuccess
    }
    
    func backToLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    func didCompleteSignUp() {
        onSignUpSuccess?()
    }
}
