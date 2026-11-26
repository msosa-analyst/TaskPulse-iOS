//
//  SignUpViewModel.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import Foundation

final class SignUpViewModel: SignUpViewModelProtocol {
    
    private let router: SignUpRouterProtocol
    
    private var checkPerson: Bool = false { didSet { evaluateCreateButtonState() } }
    private var checkEmail: Bool = false { didSet { evaluateCreateButtonState() } }
    private var checkPassword: Bool = false { didSet { evaluateCreateButtonState() } }
    private var checkConfirmPassword: Bool = false { didSet { evaluateCreateButtonState() } }
    
    private var savePassword: String = ""
    private var saveConfirmPassword: String = ""
    
    var onValidationError: ((String) -> Void)?
    var onValidationLength: ((Bool) -> Void)?
    var onValidationUpperCase: ((Bool) -> Void)?
    var onValidationLowerCase: ((Bool) -> Void)?
    var onValidationNumber: ((Bool) -> Void)?
    var onValidationActivateCreateButton: ((Bool) -> Void)?
    
    init(router: SignUpRouterProtocol) {
        self.router = router
    }
    
    func navigateToLogin() {
        router.backToLogin()
    }
    
    func verifyValidName(currentNameText: String, currentLastNameText: String) {
        checkPerson = currentNameText.hasValidPerson() && currentLastNameText.hasValidPerson()
    }
    
    func verifyValidEmail(currentEmailText: String) {
        checkEmail = currentEmailText.hasEmailValidate()
    }
    
    func verifyValidPassword(currentText: String) {
        let hasLength = currentText.hasValidMinimumLength()
        let hasUpperCase = currentText.hasUpperCase()
        let hasLowerCase = currentText.hasLowerCase()
        let hasNumber = currentText.hasNumber()
        
        onValidationLength?(hasLength)
        onValidationUpperCase?(hasUpperCase)
        onValidationLowerCase?(hasLowerCase)
        onValidationNumber?(hasNumber)
        
        savePassword = currentText
        checkPassword = hasLength && hasUpperCase && hasLowerCase && hasNumber
        
        updateConfirmPasswordState()
    }
    
    func verifyValidConfirmPassword(currentConfirmPasswordText: String) {
        saveConfirmPassword = currentConfirmPasswordText
        updateConfirmPasswordState()
    }
    
    private func updateConfirmPasswordState() {
        checkConfirmPassword = (saveConfirmPassword == savePassword)
    }
    
    func handleGoogleSignInSuccess(uid: String, email: String, firstName: String, lastName: String, fullName: String) {
        // Aquí más adelante guardaremos el perfil en Firestore (uid, email, firstName, lastName, fullName)
        router.didCompleteSignUp()
    }
    
    func handleGoogleSignInFailure(_ error: Error) {
        onValidationError?(error.localizedDescription)
    }
    
    private func evaluateCreateButtonState() {
        let isReady = checkPerson && checkEmail && checkPassword && checkConfirmPassword
        onValidationActivateCreateButton?(isReady)
    }
}
