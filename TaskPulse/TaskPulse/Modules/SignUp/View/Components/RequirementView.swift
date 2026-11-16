//
//  RequirementView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

protocol RequirementProvidable {
    static func createRequirement(in formStackView: UIStackView, contentView: UIView) -> (requirementStackView: UIStackView, minLenghtLabel: DesignPasswordRequirementLabel, upperCaseLabel: DesignPasswordRequirementLabel, lowerCaseLabel: DesignPasswordRequirementLabel, numberLabel: DesignPasswordRequirementLabel)
}

fileprivate struct RequirementFactoryImplementation: RequirementProvidable {
    static func createRequirement(in formStackView: UIStackView, contentView: UIView) -> (requirementStackView: UIStackView, minLenghtLabel: DesignPasswordRequirementLabel, upperCaseLabel: DesignPasswordRequirementLabel, lowerCaseLabel: DesignPasswordRequirementLabel, numberLabel: DesignPasswordRequirementLabel) {
        let requirementStackView = RequirementStackViewFactory.create(formStackView: formStackView, contentView: contentView)
        let minLenghtLabel = RulesLabelFactory.create(text: "Minímo 8 caracteres", requirementStackView: requirementStackView)
        let upperCaseLabel = RulesLabelFactory.create(text: "Una letra mayúscula", requirementStackView: requirementStackView)
        let lowerCaseLabel = RulesLabelFactory.create(text: "Una letra minúscula", requirementStackView: requirementStackView)
        let numberLabel = RulesLabelFactory.create(text: "Un número", requirementStackView: requirementStackView)
        return (requirementStackView, minLenghtLabel, upperCaseLabel, lowerCaseLabel, numberLabel)
    }
}

struct RequirementComponentBuilder{
    static var provider: RequirementProvidable.Type {
        return RequirementFactoryImplementation.self
    }
}

fileprivate struct RequirementStackViewFactory {
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

fileprivate struct RulesLabelFactory{
    static func create(text: String, requirementStackView: UIStackView) -> DesignPasswordRequirementLabel{
        let rulesPasswordLabel = DesignPasswordRequirementLabel()
        rulesPasswordLabel.configure(with: text, isCompleted: false)
        
        requirementStackView.addArrangedSubview(rulesPasswordLabel)
        return rulesPasswordLabel
    }
}
