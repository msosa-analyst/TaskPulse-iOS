//
//  SignUpViewProtocol.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit

protocol SignUpViewProtocol: AnyObject{

    func set(minLenghtLabel: Bool)
    func set(upperCaseLabel: Bool)
    func set(lowerCaseLabel: Bool)
    func set(numberLabel: Bool)
    func set(isFilled: Bool)
    
    var nameTextField: DesignTextField! {get}
    var lastNameTextField: DesignTextField! {get}
    var emailTextField: DesignTextField! {get}
    var passwordTextField: DesignTextField! {get}
    var confirmPassword: DesignTextField! {get}
    
    
    var continueGoogleButton: DesignButton! {get}
    var continueAppleButton: DesignButton! {get}
    var createAccount: DesignButton! {get}
    
    
    var loginButton: UIButton! {get}
}
