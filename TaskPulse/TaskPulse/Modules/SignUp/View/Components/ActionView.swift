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
        let googleButton = ButtonFactory.create(setTitle: "Continua con google", iconSystemName: "google_icon", buttonStackView: buttonStackView)
        let appleButton = ButtonFactory.create(setTitle: "Continua con apple", iconSystemName: "apple.logo", buttonStackView: buttonStackView)
        let createAccount = CreateButtonFactory.create(setTitle: "Crear cuenta", buttonStackView: buttonStackView)
        
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
    static func create(setTitle: String, iconSystemName: String, buttonStackView: UIStackView) -> DesignButton{
        let button = DesignButton()
        
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
        
        button.setTitle(setTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        return button
    }
}

fileprivate struct CreateButtonFactory {
    static func create(setTitle: String, buttonStackView: UIStackView) -> DesignButton {
        let createButton = DesignButton()
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor(red: 0x1E / 255.0, green: 0x29 / 255.0, blue: 0x3B / 255.0, alpha: 1.0)
        config.baseForegroundColor = UIColor.lightGray
        createButton.configuration = config
        
        createButton.setTitle(setTitle, for: .normal)
        createButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.addArrangedSubview(createButton)
        createButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        return createButton
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
