//
//  LoginViewController.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: DesignTextField!
    @IBOutlet private weak var passwordTextField: DesignTextField!
    
    private var viewModel: LoginViewModelProtocol
    
    init?(coder: NSCoder, viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapToDismiss()
        bindViewModel()
    }
    
    private func setupTapToDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(false)
    }
    
    private func bindViewModel() {
        viewModel.onBiometricAuthFailure = { [weak self] errorMessage in
            self?.showErrorAlert(message: errorMessage)
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(
            title: "Atención",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction private func loginButtonOnTapped(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        viewModel.navigateToHome(email: email, password: password)
    }
    
    @IBAction private func faceIDButtonOnTapped(_ sender: Any) {
        viewModel.authenticateWithBiometrics()
    }
    
    @IBAction private func signUpButtonOnTapped(_ sender: Any) {
        viewModel.navigateToCreateAccount()
    }
}
