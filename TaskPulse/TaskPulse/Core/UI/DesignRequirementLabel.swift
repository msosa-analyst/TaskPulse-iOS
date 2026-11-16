//
//  DesignRequirementLabel.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 13/11/26.
//

import UIKit

@IBDesignable
final class DesignPasswordRequirementLabel: UILabel {
    
    private let activeColor = UIColor(
        red: 0x10 / 255.0,
        green: 0xB9 / 255.0,
        blue: 0x81 / 255.0,
        alpha: 1.0
    )
    
    private let inactiveColor = UIColor(
        red: 0xE2 / 255.0,
        green: 0xE8 / 255.0,
        blue: 0xF0 / 255.0,
        alpha: 1.0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    private func setupStyle() {
        font = UIFont.systemFont(ofSize: 13, weight: .regular)
        textColor = inactiveColor
        textAlignment = .left
    }
    
    func configure(with text: String, isCompleted: Bool) {
        let imageName = isCompleted ? "checkmark.circle.fill" : "circle"
        let colorToUse = isCompleted ? activeColor : inactiveColor
        
        let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium)
        guard let iconImage = UIImage(systemName: imageName, withConfiguration: configuration)?
            .withTintColor(colorToUse, renderingMode: .alwaysOriginal) else { return }
        
        let attachment = NSTextAttachment()
        attachment.image = iconImage
        attachment.bounds = CGRect(x: 0, y: -2, width: 14, height: 14)
        
        let attributedString = NSMutableAttributedString(attachment: attachment)
        attributedString.append(NSAttributedString(string: "  \(text)"))
        
        self.attributedText = attributedString
        self.textColor = colorToUse
    }
}
