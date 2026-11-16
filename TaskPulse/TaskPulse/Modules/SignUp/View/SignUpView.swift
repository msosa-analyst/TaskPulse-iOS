//
//  SignUpView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit

class SignUpView: UIView{
    var topWave: TopWaveView!
    var bottomWave: BottomWaveView!
    var scrollContainer: DesignScrollContainerView!
    var logo: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var formStackView: UIStackView!
    var nameTextField: DesignTextField!
    var lastNameTextField: DesignTextField!
    var emailTextField: DesignTextField!
    var passwordTextField: DesignTextField!
    var minLengthLabel: DesignPasswordRequirementLabel!
    var uppercaseLabel: DesignPasswordRequirementLabel!
    var lowercaseLabel: DesignPasswordRequirementLabel!
    var numberLabel: DesignPasswordRequirementLabel!
    var requirementStackView: UIStackView!
    var confirmPassword: DesignTextField!
    var buttonStackView: UIStackView!
    var continueGoogleButton: DesignButton!
    var continueAppleButton: DesignButton!
    var createAccount: DesignButton!
    var loginButton: UIButton!
    var hasAccountLabel: UILabel!
    var promptStackView: UIStackView!
    
    
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
}
