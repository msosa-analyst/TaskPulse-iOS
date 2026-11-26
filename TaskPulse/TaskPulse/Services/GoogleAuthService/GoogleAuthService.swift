//
//  GoogleAuthService.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 23/11/26.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

enum GoogleAuthError: Error {
    case cancelled
}

struct GoogleSignInResult {
    let user: User
    let email: String
    let firstName: String
    let lastName: String
    let fullName: String
}

protocol GoogleAuthServiceProtocol {
    func signIn(
        from viewController: UIViewController,
        completion: @escaping (Result<GoogleSignInResult, Error>) -> Void
    )
}

final class GoogleAuthService: GoogleAuthServiceProtocol {
    
    func signIn(
        from viewController: UIViewController,
        completion: @escaping (Result<GoogleSignInResult, Error>) -> Void
    ) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(NSError(
                domain: "GoogleAuthService",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Falta CLIENT_ID en GoogleService-Info.plist."]
            )))
            return
        }
        
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { signInResult, error in
            if let error = error {
                if let gidError = error as? GIDSignInError, gidError.code == .canceled {
                    completion(.failure(GoogleAuthError.cancelled))
                    return
                }
                
                let nsError = error as NSError
                if nsError.domain == kGIDSignInErrorDomain && nsError.code == GIDSignInError.canceled.rawValue {
                    completion(.failure(GoogleAuthError.cancelled))
                    return
                }
                
                completion(.failure(error))
                return
            }
            
            guard
                let googleUser = signInResult?.user,
                let idToken = googleUser.idToken?.tokenString
            else {
                completion(.failure(NSError(
                    domain: "GoogleAuthService",
                    code: -2,
                    userInfo: [NSLocalizedDescriptionKey: "No se obtuvo el idToken de Google."]
                )))
                return
            }
            
            let accessToken = googleUser.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, authError in
                if let authError = authError {
                    completion(.failure(authError))
                    return
                }
                
                guard let firebaseUser = authResult?.user else {
                    completion(.failure(NSError(
                        domain: "GoogleAuthService",
                        code: -3,
                        userInfo: [NSLocalizedDescriptionKey: "No se obtuvo el usuario de Firebase."]
                    )))
                    return
                }
                
                let profile = googleUser.profile
                let firstName = profile?.givenName ?? ""
                let lastName = profile?.familyName ?? ""
                let fullName = profile?.name ?? "\(firstName) \(lastName)".trimmingCharacters(in: .whitespaces)
                let email = profile?.email ?? firebaseUser.email ?? ""
                
                completion(.success(GoogleSignInResult(
                    user: firebaseUser,
                    email: email,
                    firstName: firstName,
                    lastName: lastName,
                    fullName: fullName
                )))
            }
        }
    }
}
