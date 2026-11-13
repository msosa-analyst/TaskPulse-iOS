//
//  DesignButton.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

@IBDesignable
final class DesignButton: UIButton {

    @IBInspectable var iconSystemName: String = "" {
        didSet {
            configureIcon()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }

    private func setupStyle() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 0x33/255.0, green: 0x41/255.0, blue: 0x55/255.0, alpha: 1.0).cgColor
    }

    private func configureIcon() {
        guard !iconSystemName.isEmpty else { return }

        var config = configuration ?? UIButton.Configuration.plain()
        config.image = UIImage(systemName: iconSystemName)
        config.imagePlacement = .trailing
        config.imagePadding = 8.0
        config.baseForegroundColor = .white
        configuration = config
    }
}
