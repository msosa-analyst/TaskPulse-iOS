//
//  LoginViewModelProtocol.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    var onBiometricAuthFailure: ((String) -> Void)? { get set }
    var isBiometricAvailable: Bool { get }
    
    func authenticateWithBiometrics()
    func navigateToCreateAccount()
    func navigateToHome(email: String, password: String)
}
