//
//  ActionView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit
protocol ActionViewProvidable{
    static func createAction(in requirementStackView: UIStackView, contentView: UIView) -> (confirmPassword: DesignTextField, buttonStackView: UIStackView, googleButton: DesignButton, appleButton: DesignButton, createAccount: DesignButton)
}

fileprivate struct ActionFactoryImplementation: ActionViewProvidable{
    static func createAction(in requirementStackView: UIStackView, contentView: UIView) -> (confirmPassword: DesignTextField, buttonStackView: UIStackView, googleButton: DesignButton, appleButton: DesignButton, createAccount: DesignButton) {
        let confirmPassword = ConfirmPasswordFactory.create(placeholder: "Repetir contraseña", iconName: "lock.fill", contentView: contentView, requirementStackView: requirementStackView)
        let buttonStackView = ButtonStackViewFactory.create(confirmPassword: confirmPassword, contentView: contentView)
        let googleButton = ButtonFactory.create(setTitle: "Continua con google", iconSystemName: "google_icon", isFilled: false, buttonStackView: buttonStackView)
        let appleButton = ButtonFactory.create(setTitle: "Continua con apple", iconSystemName: "apple.logo", isFilled: false, buttonStackView: buttonStackView)
        let createAccount = ButtonFactory.create(setTitle: "Crear cuenta", iconSystemName: "none", isFilled: true, buttonStackView: buttonStackView)
        return (confirmPassword, buttonStackView, googleButton, appleButton, createAccount)
    }
}

struct ActionComponentBuilder{
    static var provider: ActionViewProvidable.Type{
        return ActionFactoryImplementation.self
    }
}


fileprivate struct ConfirmPasswordFactory{
    static func create(placeholder: String, iconName: String, contentView: UIView, requirementStackView: UIStackView) -> DesignTextField{
        let confirmPassword = DesignTextField()
        confirmPassword.customPlaceholder = placeholder
        confirmPassword.iconSystemName = iconName
        confirmPassword.textContentType = .password
        confirmPassword.isSecureTextEntry = true
        confirmPassword.clearButtonMode = .whileEditing
        
        confirmPassword.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(confirmPassword)
        
        NSLayoutConstraint.activate([
            confirmPassword.topAnchor.constraint(equalTo: requirementStackView.bottomAnchor, constant: 15),
            confirmPassword.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            confirmPassword.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            confirmPassword.heightAnchor.constraint(equalToConstant: 45)
        ])
        return confirmPassword
    }
}


fileprivate struct ButtonFactory{
    static func create(setTitle: String, iconSystemName: String, isFilled: Bool, buttonStackView: UIStackView) -> DesignButton{
        let button = DesignButton()
        
        if isFilled {
            let config = UIButton.Configuration.filled()
            button.configuration = config
        }
        else {
            var config = button.configuration ?? UIButton.Configuration.plain()
            if iconSystemName == "google_icon"{
                config.image = UIImage(named: iconSystemName)
            }
            else {
                let symbolConfig = UIImage.SymbolConfiguration(hierarchicalColor: .white)
                config.image = UIImage(systemName: iconSystemName, withConfiguration: symbolConfig)
            }
            config.imagePlacement = .leading
            config.imagePadding = 15.0
            button.configuration = config
        }
        
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        return button
    }
}

fileprivate struct ButtonStackViewFactory{
        static func create(confirmPassword: UITextField, contentView: UIView) -> UIStackView{
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fill
        buttonStackView.spacing = 10
        
        contentView.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        buttonStackView.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 25),
        buttonStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 38),
        buttonStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
        return buttonStackView
    }
}
