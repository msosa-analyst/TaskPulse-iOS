//
//  formView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

protocol FormViewProvidable{
    static func createForm(in subTitleLabel: UILabel, contentView: UIView) -> (formStackView: UIStackView, nameTextField: DesignTextField, lastNameTextField: DesignTextField, emailTextField: DesignTextField, passwordTextField: DesignTextField)
}

fileprivate struct FormFactoryImplementation: FormViewProvidable{
    static func createForm(in subTitleLabel: UILabel, contentView: UIView) -> (formStackView: UIStackView, nameTextField: DesignTextField, lastNameTextField: DesignTextField, emailTextField: DesignTextField, passwordTextField: DesignTextField) {
        let formStackView = FormStackViewFactory.create(subTitleLabel: subTitleLabel, contentView: contentView)
        let nameTextField = PersonTextFieldFactory.create(placeholder: "Nombre", iconName: "person", formStackView: formStackView)
        let lastNameTextField = PersonTextFieldFactory.create(placeholder: "Apellido", iconName: "person.text.rectangle", formStackView: formStackView)
        let emailTextField = EmailTextFieldFactory.create(placeholder: "Correo electrónico", iconName: "envelope", formStackView: formStackView)
        let passwordTextField = PasswordTextFieldFactory.create(placeholder: "Contraseña", iconName: "lock", formStackView: formStackView)
        return (formStackView, nameTextField, lastNameTextField, emailTextField, passwordTextField)
    }
}

struct FormComponentBuilder{
    static var provider: FormViewProvidable.Type {
        return FormFactoryImplementation.self
    }
}

fileprivate struct FormStackViewFactory{
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



fileprivate struct PersonTextFieldFactory{
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

fileprivate struct EmailTextFieldFactory{
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

fileprivate struct PasswordTextFieldFactory{
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

