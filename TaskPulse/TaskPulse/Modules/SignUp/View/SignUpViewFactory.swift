//
//  SignUpViewFactory.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit


class SignUpViewFactory{
    static func create() -> SignUpView{
        let signUpView = SignUpView()
        
        let background = BackgoundComponentBuilder.provider.createBackground(in: signUpView)
        
        let contentView = background.scrollView.contentView
        
        let header = HeaderComponentBuilder.provider.createHeader(in: contentView)
        
        let form = FormComponentBuilder.provider.createForm(in: header.subtitle, contentView: contentView)
        signUpView.nameTextField = form.nameTextField
        signUpView.lastNameTextField = form.lastNameTextField
        signUpView.emailTextField = form.emailTextField
        signUpView.passwordTextField = form.passwordTextField
        
        let requirement = RequirementComponentBuilder.provider.createRequirement(in: form.formStackView, contentView: contentView)
        signUpView.minLenghtLabel = requirement.minLenghtLabel
        signUpView.upperCaseLabel = requirement.upperCaseLabel
        signUpView.lowerCaseLabel = requirement.lowerCaseLabel
        signUpView.numberLabel = requirement.numberLabel
        
        let action = ActionComponentBuilder.provider.createAction(in: requirement.requirementStackView, contentView: contentView)
        signUpView.confirmPassword = action.confirmPassword
        signUpView.continueGoogleButton = action.googleButton
        signUpView.continueAppleButton = action.appleButton
        signUpView.createAccount = action.createAccount
        
        let prompt = PrompComponentBuilder.provider.createPrompt(in: action.buttonStackView, contentView: contentView)

        signUpView.loginButton = prompt.login
        
        return signUpView
    }
}
