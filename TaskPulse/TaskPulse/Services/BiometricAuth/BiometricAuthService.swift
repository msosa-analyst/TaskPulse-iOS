//
//  BiometricAuthService.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import Foundation
import LocalAuthentication

enum BiometricType {
    case none
    case touchID
    case faceID
    case opticID
}

protocol BiometricAuthServiceProtocol {
    func canEvaluatePolicy() -> Bool
    func getBiometricType() -> BiometricType
    func authenticateUser(reason: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

final class BiometricAuthService: BiometricAuthServiceProtocol {
    
    private let context = LAContext()
    
    func canEvaluatePolicy() -> Bool {
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    func getBiometricType() -> BiometricType {
        let _ = canEvaluatePolicy()
        
        switch context.biometryType {
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        case .opticID:
            return .opticID
        default:
            return .none
        }
    }
    
    func authenticateUser(reason: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let localContext = LAContext()
        var error: NSError?
        
        guard localContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            if let err = error {
                completion(.failure(err))
            } else {
                let defaultError = NSError(
                    domain: "BiometricAuth",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "La autenticación biométrica no está disponible en este dispositivo."]
                )
                completion(.failure(defaultError))
            }
            return
        }
        
        localContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
            DispatchQueue.main.async {
                if success {
                    completion(.success(true))
                } else if let error = authError {
                    completion(.failure(error))
                }
            }
        }
    }
}
