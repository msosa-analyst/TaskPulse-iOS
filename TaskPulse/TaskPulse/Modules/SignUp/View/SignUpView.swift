//
//  SignUpView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit

class SignUpView: UIView, SignUpViewProtocol{

    var nameTextField: DesignTextField!
    var lastNameTextField: DesignTextField!
    var emailTextField: DesignTextField!
    var passwordTextField: DesignTextField!
    var confirmPassword: DesignTextField!
    
    var minLenghtLabel: DesignPasswordRequirementLabel!
    var upperCaseLabel: DesignPasswordRequirementLabel!
    var lowerCaseLabel: DesignPasswordRequirementLabel!
    var numberLabel: DesignPasswordRequirementLabel!
    
    var continueGoogleButton: DesignButton!
    var continueAppleButton: DesignButton!
    var createAccount: DesignButton!
    
    
    var loginButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        Setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func Setup(){
        backgroundColor = UIColor(
            red: 0x0B / 255.0,
            green: 0x12 / 255.0,
            blue: 0x20 / 255.0,
            alpha: 1.0
        )
    }

    func set(minLenghtLabel: Bool) {
        self.minLenghtLabel.configure(isCompleted: minLenghtLabel)
    }
    
    func set(upperCaseLabel: Bool) {
        self.upperCaseLabel.configure(isCompleted: upperCaseLabel)
    }
    
    func set(lowerCaseLabel: Bool) {
        self.lowerCaseLabel.configure(isCompleted: lowerCaseLabel)
    }
    
    func set(numberLabel: Bool) {
        self.numberLabel.configure(isCompleted: numberLabel)
    }
    
    func set(isFilled: Bool) {
        var config = createAccount.configuration ?? UIButton.Configuration.filled()
        
        if isFilled {
            config.baseBackgroundColor = .systemBlue
            config.baseForegroundColor = .white
        } else {
            config.baseBackgroundColor = UIColor(red: 0x1E / 255.0, green: 0x29 / 255.0, blue: 0x3B / 255.0, alpha: 1.0)
            config.baseForegroundColor = UIColor.lightGray
        }
        
        createAccount.configuration = config
    }
}
