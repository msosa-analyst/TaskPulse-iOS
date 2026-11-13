//
//  LoginViewModel.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 11/11/26.
//

import Foundation

final class LoginViewModel {
    
    private let router: LoginRouterProtocol
    private let biometricService: BiometricAuthServiceProtocol
    
    var onBiometricAuthFailure: ((String) -> Void)?
    
    init(
        router: LoginRouterProtocol,
        biometricService: BiometricAuthServiceProtocol = BiometricAuthService()
    ) {
        self.router = router
        self.biometricService = biometricService
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    
    var isBiometricAvailable: Bool {
        let hasLoggedInBefore = UserDefaults.standard.bool(forKey: AppConstants.UserDefaultsKeys.hasLoggedInBefore)
        return biometricService.canEvaluatePolicy() && hasLoggedInBefore
    }
    
    func navigateToCreateAccount() {
        router.navigateToCreateAccount()
    }
    
    func navigateToHome(email: String, password: String) {
        let cleanEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !cleanEmail.isEmpty, !cleanPassword.isEmpty else {
            onBiometricAuthFailure?("Por favor ingresa tu correo y contraseña.")
            return
        }
        
        UserDefaults.standard.set(true, forKey: AppConstants.UserDefaultsKeys.hasLoggedInBefore)
        router.navigateToHome()
    }
    
    func authenticateWithBiometrics() {
        guard isBiometricAvailable else {
            onBiometricAuthFailure?("Debes iniciar sesión con correo y contraseña al menos una vez antes de usar biometría.")
            return
        }
        
        let reason = "Inicia sesión en TaskPulse con tu biometría."
        
        biometricService.authenticateUser(reason: reason) { [weak self] result in
            switch result {
            case .success:
                self?.router.navigateToHome()
            case .failure(let error):
                self?.onBiometricAuthFailure?(error.localizedDescription)
            }
        }
    }
}
