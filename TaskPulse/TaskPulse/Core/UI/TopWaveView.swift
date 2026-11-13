//
//  TopWaveView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class TopWaveView: UIView {

    private let gradientLayer = CAGradientLayer()
    private let radialGlowLayer = CAGradientLayer()
    private let shapeMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        radialGlowLayer.frame = bounds
        shapeMask.path = createTopWavePath().cgPath
    }

    private func setupView() {
        backgroundColor = .clear

        let startColor = UIColor(red: 0x1E/255.0, green: 0x40/255.0, blue: 0xAF/255.0, alpha: 1.0).cgColor
        let endColor = UIColor(red: 0x0B/255.0, green: 0x12/255.0, blue: 0x20/255.0, alpha: 0.1).cgColor

        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0.0, 0.90]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)

        let glowBright = UIColor(red: 0xDB/255.0, green: 0xEA/255.0, blue: 0xFE/255.0, alpha: 0.85).cgColor
        let glowMid = UIColor(red: 0x25/255.0, green: 0x63/255.0, blue: 0xEB/255.0, alpha: 0.4).cgColor
        let glowClear = UIColor.clear.cgColor

        radialGlowLayer.type = .radial
        radialGlowLayer.colors = [glowBright, glowMid, glowClear]
        radialGlowLayer.locations = [0.0, 0.35, 1.0]
        radialGlowLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        radialGlowLayer.endPoint = CGPoint(x: 0.0, y: 0.50)

        layer.addSublayer(gradientLayer)
        layer.addSublayer(radialGlowLayer)
        layer.mask = shapeMask
    }

    private func createTopWavePath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height

        path.move(to: CGPoint(x: 0, y: height))

        path.addCurve(
            to: CGPoint(x: width, y: height * 0.3),
            controlPoint1: CGPoint(x: width * 0.33, y: height * 0.90),
            controlPoint2: CGPoint(x: width * 0.80, y: height * 0.8)
        )

        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()

        return path
    }
}
