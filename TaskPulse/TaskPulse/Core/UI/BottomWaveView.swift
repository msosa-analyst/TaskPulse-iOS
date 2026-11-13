//
//  BottomWaveView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class BottomWaveView: UIView {

    private let baseGradientLayer = CAGradientLayer()
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
        baseGradientLayer.frame = bounds
        radialGlowLayer.frame = bounds
        shapeMask.path = createWavePath().cgPath
    }

    private func setupView() {
        backgroundColor = .clear

        let primaryBlue = UIColor(red: 0x1E/255.0, green: 0x40/255.0, blue: 0xAF/255.0, alpha: 1.0).cgColor
        let darkBlue = UIColor(red: 0x0B/255.0, green: 0x12/255.0, blue: 0x20/255.0, alpha: 0.1).cgColor

        baseGradientLayer.colors = [primaryBlue, darkBlue]
        baseGradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        baseGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)

        let glowBright = UIColor(red: 0xDB/255.0, green: 0xEA/255.0, blue: 0xFE/255.0, alpha: 0.85).cgColor
        let glowMid = UIColor(red: 0x25/255.0, green: 0x63/255.0, blue: 0xEB/255.0, alpha: 0.4).cgColor
        let glowClear = UIColor.clear.cgColor

        radialGlowLayer.type = .radial
        radialGlowLayer.colors = [glowBright, glowMid, glowClear]
        radialGlowLayer.locations = [0.0, 0.35, 1.0]
        radialGlowLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        radialGlowLayer.endPoint = CGPoint(x: 0.85, y: 0.3)

        layer.addSublayer(baseGradientLayer)
        layer.addSublayer(radialGlowLayer)
        layer.mask = shapeMask
    }

    private func createWavePath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height

        path.move(to: CGPoint(x: 0, y: height * 0.70))

        path.addCurve(
            to: CGPoint(x: width * 0.20, y: height * 0.69),
            controlPoint1: CGPoint(x: width * 0.06, y: height * 0.67),
            controlPoint2: CGPoint(x: width * 0.14, y: height * 0.67)
        )

        path.addCurve(
            to: CGPoint(x: width, y: height * 0.15),
            controlPoint1: CGPoint(x: width * 0.33, y: height * 0.72),
            controlPoint2: CGPoint(x: width * 0.70, y: height * 0.60)
        )

        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()

        return path
    }
}
