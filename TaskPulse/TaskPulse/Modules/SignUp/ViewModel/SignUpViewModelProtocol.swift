//
//  SignUpViewModelProtocol.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 17/11/26.
//

import Foundation

protocol SignUpViewModelProtocol: AnyObject {
    func navigateToLogin()

    func verifyValidName(currentNameText: String, currentLastNameText: String)
    func verifyValidEmail(currentEmailText: String)
    
    func verifyValidPassword(currentText: String)
    var onValidationLength: ((Bool) -> Void)? { get set }
    var onValidationUpperCase: ((Bool) -> Void)? { get set }
    var onValidationLowerCase: ((Bool) -> Void)? { get set }
    var onValidationNumber: ((Bool) -> Void)? { get set }
    func verifyValidConfirmPassword(currentConfirmPasswordText: String)
    
    func handleGoogleSignInSuccess(uid: String, email: String, firstName: String, lastName: String, fullName: String)
    func handleGoogleSignInFailure(_ error: Error)
    
    var onValidationActivateCreateButton: ((Bool) -> Void)? { get set }
    var onValidationError: ((String) -> Void)? { get set }
}
