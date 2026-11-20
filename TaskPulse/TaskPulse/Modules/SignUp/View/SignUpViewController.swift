//
//  SignUpViewController.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

class SignUpViewController: UIViewController{
    private var _view: SignUpViewProtocol{
        self.view as! SignUpViewProtocol
    }
    
    private let viewModel: SignUpViewModelProtocol
    
    init(viewModel: SignUpViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = SignUpViewFactory.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _view.nameTextField.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
        _view.lastNameTextField.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
        _view.emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        _view.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        _view.confirmPassword.addTarget(self, action: #selector(confirmPasswordDidChange), for: .editingChanged)

        
        _view.continueGoogleButton.addTarget(self, action: #selector(googleActionButtonTapped), for: .touchUpInside)
        _view.continueAppleButton.addTarget(self, action: #selector(appleActionButtonTapped), for: .touchUpInside)
        _view.createAccount.addTarget(self, action: #selector(createAccountActionButtonTapped), for: .touchUpInside)
        _view.loginButton.addTarget(self, action: #selector(loginActionButtonTapped), for: .touchUpInside)
        
        viewModel.onValidationLength = { [weak self] isValid in self?._view.set(minLenghtLabel: isValid)}
        viewModel.onValidationUpperCase = { [weak self] isValid in self?._view.set(upperCaseLabel: isValid)}
        viewModel.onValidationLowerCase = { [weak self] isValid in self?._view.set(lowerCaseLabel: isValid)}
        viewModel.onValidationNumber = { [weak self] isValid in self?._view.set(numberLabel: isValid)}
        viewModel.onValidationActivateCreateButton = { [weak self] isValid in self?._view.set(isFilled: isValid)}
    }
    
    @objc private func nameDidChange(){
        let currentNameText = _view.nameTextField.text ?? ""
        let currentLastNameText = _view.lastNameTextField.text ?? ""
        viewModel.verifyValidName(currentNameText: currentNameText, currentLastNameText: currentLastNameText)
    }
    
    @objc private func emailDidChange(){
        let currentEmailText = _view.emailTextField.text ?? ""
        viewModel.verifyValidEmail(currentEmailText: currentEmailText)
    }
    
    @objc private func passwordDidChange(){
        let currentText = _view.passwordTextField.text ?? ""
        viewModel.verifyValidPassword(currentText: currentText)
    }
    
    @objc private func confirmPasswordDidChange(){
        let currentConfirmPasswordText = _view.confirmPassword.text ?? ""
        viewModel.verifyValidConfirmPassword(currentConfirmPasswordText: currentConfirmPasswordText)
    }
    
    @objc private func googleActionButtonTapped(){
        
    }
    
    @objc private func appleActionButtonTapped(){
        
    }
    
    @objc private func createAccountActionButtonTapped(){
        
    }
    
    @objc private func loginActionButtonTapped(){
        viewModel.navigateToLogin()
    }
}
