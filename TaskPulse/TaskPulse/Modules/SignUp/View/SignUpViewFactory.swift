//
//  SignUpViewFactory.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit

class SignUpViewTopBackgroundFactory{
    static func create(signUpView: UIView) -> TopWaveView{
        let topWaveView = TopWaveView()

        signUpView.addSubview(topWaveView)
        topWaveView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                    topWaveView.topAnchor.constraint(equalTo: signUpView.topAnchor),
                    topWaveView.leadingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.leadingAnchor),
                    topWaveView.trailingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.trailingAnchor),
                    topWaveView.heightAnchor.constraint(equalToConstant: 220)
                ])
        

        return topWaveView
    }
}

class SignUpViewBottomBackgroundFactory{
    static func create(signUpView: UIView) -> BottomWaveView{
        let bottomWaveView = BottomWaveView()

        signUpView.addSubview(bottomWaveView)
        bottomWaveView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                    bottomWaveView.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor),
                    bottomWaveView.leadingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.leadingAnchor),
                    bottomWaveView.trailingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.trailingAnchor),
                    bottomWaveView.heightAnchor.constraint(equalToConstant: 220)
                ])
        

        return bottomWaveView
    }
}

class SignUpViewLogoFactory{
    static func create(contentView: UIView) -> UIImageView {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "LogoSinFondo")
        
        contentView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                    logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
                    logoImageView.heightAnchor.constraint(equalToConstant: 220),
                    logoImageView.widthAnchor.constraint(equalToConstant: 240),
                    logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
                ])
        
        return logoImageView
    }
}

class SignUpViewTitleLabelFactory{
    static func create(logoImageView: UIImageView, contentView: UIView) -> UILabel{
        let titleLabel = UILabel()
        titleLabel.text = "Crear Cuenta"
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        return titleLabel
    }
}

class SignUpViewSubTitleFactory{
    static func create(titleLabel: UILabel, contentView: UIView) -> UILabel{
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Comienza con taskPulse"
        subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        subtitleLabel.textColor = UIColor(
                    red: 0x94 / 255.0,
                    green: 0xA3 / 255.0,
                    blue: 0xB8 / 255.0,
                    alpha: 1.0
                )
        subtitleLabel.textAlignment = .center
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        return subtitleLabel
    }
}

class SignUpViewPersonTextFieldFactory{
    static func create(placeholder: String, iconName: String, formStackView: UIStackView) -> DesignTextField {
        let personTextField = DesignTextField()
        personTextField.customPlaceholder = placeholder
        personTextField.iconSystemName = iconName
        personTextField.textContentType = .name
        personTextField.clearButtonMode = .whileEditing
        
        personTextField.translatesAutoresizingMaskIntoConstraints = false
                personTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        formStackView.addArrangedSubview(personTextField)
        
        return personTextField
    }
}

class SignUpViewEmailTextFieldFactory{
    static func create(placeholder: String, iconName: String, formStackView: UIStackView) -> DesignTextField {
        let emailTextField = DesignTextField()
        emailTextField.customPlaceholder = placeholder
        emailTextField.iconSystemName = iconName
        emailTextField.textContentType = .emailAddress
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .whileEditing
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
                emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        formStackView.addArrangedSubview(emailTextField)
        return emailTextField
    }
}

class SignUpViewPasswordTextFieldFactory{
    static func create(placeholder: String, iconName: String, formStackView: UIStackView) -> DesignTextField {
        let passwordTextField = DesignTextField()
        passwordTextField.customPlaceholder = placeholder
        passwordTextField.iconSystemName = iconName
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
                passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        

        formStackView.addArrangedSubview(passwordTextField)
        return passwordTextField
    }
}

class SignUpViewformStackViewFactory{
    static func create(subTitleLabel: UILabel, contentView: UIView) -> UIStackView{
        let formStackView = UIStackView()
        formStackView.axis = .vertical
        formStackView.alignment = .fill
        formStackView.distribution = .fill
        formStackView.spacing = 15
        
        contentView.addSubview(formStackView)
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        formStackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
        formStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        formStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

        return formStackView
    }
}

class SignUpViewRequirementStackViewFactory {
    static func create(formStackView: UIStackView, contentView: UIView) -> UIStackView{
        let requirementStackView = UIStackView()
        requirementStackView.axis = .vertical
        requirementStackView.alignment = .fill
        requirementStackView.distribution = .fill
        requirementStackView.spacing = 6
        
        contentView.addSubview(requirementStackView)
        requirementStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        requirementStackView.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 15),
        requirementStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 38),
        requirementStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

        return requirementStackView
    }
}

class SignUpViewRulesPasswordLabelFactory{
    static func create(text: String, requirementStackView: UIStackView) -> DesignPasswordRequirementLabel{
        let rulesPasswordLabel = DesignPasswordRequirementLabel()
        rulesPasswordLabel.configure(with: text, isCompleted: false)
        
        requirementStackView.addArrangedSubview(rulesPasswordLabel)
        return rulesPasswordLabel
    }
}

class SignUpViewConfirmPasswordFactory{
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

class SignUpViewButtonFactory{
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

class SignUpViewButtonStackViewFactory{
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

class signUpViewHasAccountLabelFactory{
    static func create(promptStackView: UIStackView) -> UILabel{
        let hasAccountLabel = UILabel()
        hasAccountLabel.text = "¿Ya tienes cuenta?"
        hasAccountLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        hasAccountLabel.textColor = UIColor(
                    red: 0x94 / 255.0,
                    green: 0xA3 / 255.0,
                    blue: 0xB8 / 255.0,
                    alpha: 1.0
                )
        hasAccountLabel.textAlignment = .right
        
        promptStackView.addArrangedSubview(hasAccountLabel)
        return hasAccountLabel
    }
}

class SignUpViewLoginButtonFactory{
    static func create(promptStackView: UIStackView) -> UIButton{
        let loginButton = UIButton()
        loginButton.setTitle("Inicia sesión", for: .normal)
        loginButton.backgroundColor = .clear
        loginButton.setTitleColor(.systemBlue, for: .normal)
        loginButton.contentHorizontalAlignment = .leading
        
        promptStackView.addArrangedSubview(loginButton)
        
        return loginButton
    }
}

class SignUpViewPromptStackViewFactory{
    static func create(contentView: UIView, buttonStackView: UIStackView) -> UIStackView{
        let promptStackView = UIStackView()
        promptStackView.axis = .horizontal
        promptStackView.alignment = .fill
        promptStackView.distribution = .fill
        promptStackView.spacing = 5
        
        contentView.addSubview(promptStackView)
        promptStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        promptStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 25),
        promptStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        promptStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
        return promptStackView
    }
}

class SignUpViewScrollContainerFactory {
    static func create(signUpView: UIView) -> DesignScrollContainerView {
        let scrollContainer = DesignScrollContainerView()
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        signUpView.addSubview(scrollContainer)
        
        NSLayoutConstraint.activate([
            scrollContainer.topAnchor.constraint(equalTo: signUpView.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor)
        ])
    
        return scrollContainer
    }
}

class SignUpViewFactory{
    static func create() -> SignUpView{
        let signUpView = SignUpView()
        signUpView.topWave = SignUpViewTopBackgroundFactory.create(signUpView: signUpView)
        signUpView.bottomWave = SignUpViewBottomBackgroundFactory.create(signUpView: signUpView)
        
        signUpView.scrollContainer = SignUpViewScrollContainerFactory.create(signUpView: signUpView)
        
        signUpView.logo = SignUpViewLogoFactory.create(contentView: signUpView.scrollContainer.contentView)
        signUpView.titleLabel = SignUpViewTitleLabelFactory.create(logoImageView: signUpView.logo, contentView: signUpView.scrollContainer.contentView)
        signUpView.subTitleLabel = SignUpViewSubTitleFactory.create(titleLabel: signUpView.titleLabel, contentView: signUpView.scrollContainer.contentView)
        
        
        signUpView.formStackView = SignUpViewformStackViewFactory.create(subTitleLabel: signUpView.subTitleLabel, contentView: signUpView.scrollContainer.contentView)
        signUpView.nameTextField = SignUpViewPersonTextFieldFactory.create(placeholder: "Nombre", iconName: "person", formStackView: signUpView.formStackView)
        signUpView.lastNameTextField = SignUpViewPersonTextFieldFactory.create(placeholder: "Apellido", iconName: "person.text.rectangle", formStackView: signUpView.formStackView)
        signUpView.emailTextField = SignUpViewEmailTextFieldFactory.create(placeholder: "Correo electrónico", iconName: "envelope", formStackView: signUpView.formStackView)
        signUpView.passwordTextField = SignUpViewPasswordTextFieldFactory.create(placeholder: "Contraseña", iconName: "lock", formStackView: signUpView.formStackView)
        
        
        signUpView.requirementStackView = SignUpViewRequirementStackViewFactory.create(formStackView: signUpView.formStackView, contentView: signUpView.scrollContainer.contentView)
        signUpView.minLengthLabel = SignUpViewRulesPasswordLabelFactory.create(text: "Minímo 8 caracteres", requirementStackView: signUpView.requirementStackView)
        signUpView.uppercaseLabel = SignUpViewRulesPasswordLabelFactory.create(text: "Una letra mayúscula", requirementStackView: signUpView.requirementStackView)
        signUpView.lowercaseLabel = SignUpViewRulesPasswordLabelFactory.create(text: "Una letra minúscula", requirementStackView: signUpView.requirementStackView)
        signUpView.numberLabel = SignUpViewRulesPasswordLabelFactory.create(text: "Un número", requirementStackView: signUpView.requirementStackView)
        
        
        signUpView.confirmPassword = SignUpViewConfirmPasswordFactory.create(placeholder: "Repetir contraseña", iconName: "envelope", contentView: signUpView.scrollContainer.contentView, requirementStackView: signUpView.requirementStackView)
        
        
        signUpView.buttonStackView = SignUpViewButtonStackViewFactory.create(confirmPassword: signUpView.confirmPassword, contentView: signUpView.scrollContainer.contentView)
        signUpView.continueGoogleButton = SignUpViewButtonFactory.create(setTitle: "Continua con google", iconSystemName: "google_icon", isFilled: false, buttonStackView: signUpView.buttonStackView)
        signUpView.continueAppleButton = SignUpViewButtonFactory.create(setTitle: "Continua con apple", iconSystemName: "apple.logo", isFilled: false, buttonStackView: signUpView.buttonStackView)
        signUpView.createAccount = SignUpViewButtonFactory.create(setTitle: "Crear cuenta", iconSystemName: "none", isFilled: true, buttonStackView: signUpView.buttonStackView)
        
        signUpView.promptStackView = SignUpViewPromptStackViewFactory.create(contentView: signUpView.scrollContainer.contentView, buttonStackView: signUpView.buttonStackView)
        signUpView.hasAccountLabel = signUpViewHasAccountLabelFactory.create(promptStackView: signUpView.promptStackView)
        signUpView.loginButton = SignUpViewLoginButtonFactory.create(promptStackView: signUpView.promptStackView)
        
        return signUpView
    }
}
