//
//  HeaderView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

protocol HeaderProvidable {
    static func createHeader(in contentView: UIView) -> (logo: UIImageView, title: UILabel, subtitle: UILabel)
}

fileprivate struct HeaderFactoryImplementation: HeaderProvidable {
    static func createHeader(in contentView: UIView) -> (logo: UIImageView, title: UILabel, subtitle: UILabel) {
        let logo = LogoFactory.create(in: contentView)
        let title = TitleFactory.create(logo: logo, in: contentView)
        let subtitle = SubtitleFactory.create(title: title, in: contentView)
        return (logo, title, subtitle)
    }
}

struct HeaderComponentBuilder {
    static var provider: HeaderProvidable.Type {
        return HeaderFactoryImplementation.self
    }
}

fileprivate struct LogoFactory {
    static func create(in contentView: UIView) -> UIImageView {
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

fileprivate struct TitleFactory {
    static func create(logo: UIImageView, in contentView: UIView) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = "Crear Cuenta"
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        return titleLabel
    }
}

fileprivate struct SubtitleFactory {
    static func create(title: UILabel, in contentView: UIView) -> UILabel {
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Comienza con taskPulse"
        subtitleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        subtitleLabel.textColor = UIColor(red: 0x94/255.0, green: 0xA3/255.0, blue: 0xB8/255.0, alpha: 1.0)
        subtitleLabel.textAlignment = .center
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: title.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        return subtitleLabel
    }
}
