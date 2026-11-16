//
//  PromptView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

protocol PromptProvidable{
    static func createPrompt(in buttonStackView: UIStackView, contentView: UIView) -> (promptStackView: UIStackView, hasAccountLabel: UILabel, login: UIButton)
}

fileprivate struct PromptFactoryImplementation: PromptProvidable {
    static func createPrompt(in buttonStackView: UIStackView, contentView: UIView) -> (promptStackView: UIStackView, hasAccountLabel: UILabel, login: UIButton) {
        let prompStackView = PromptStackViewFactory.create(contentView: contentView, buttonStackView: buttonStackView)
        let hasAccountLabel = HasAccountLabelFactory.create(promptStackView: prompStackView)
        let login = LoginButtonFactory.create(promptStackView: prompStackView)
        
        return (prompStackView, hasAccountLabel, login)
    }
}

struct PrompComponentBuilder {
    static var provider: PromptProvidable.Type{
        return PromptFactoryImplementation.self
    }
}

fileprivate struct PromptStackViewFactory{
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

fileprivate struct HasAccountLabelFactory{
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

fileprivate struct LoginButtonFactory{
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
