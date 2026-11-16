//
//  BackgroundView.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 16/11/26.
//

import UIKit

protocol BackgoundProvidable {
    static func createBackground(in signUpView: UIView) -> (topWaveView: TopWaveView, bottomWaveView: BottomWaveView, scrollView: DesignScrollContainerView)
}

fileprivate struct BackgoundFactoryImplementation: BackgoundProvidable{
    
    static func createBackground(in signUpView: UIView) -> (topWaveView: TopWaveView, bottomWaveView: BottomWaveView, scrollView: DesignScrollContainerView) {
        let topWaveView = topWaveFactory.create(in: signUpView)
        let bottonWaveView = bottomWaveFactory.create(signUpView: signUpView)
        let scrollView = scrollViewFactory.create(signUpView: signUpView)
        
        return (topWaveView, bottonWaveView, scrollView)
    }
    
}

struct BackgoundComponentBuilder {
    static var provider: BackgoundProvidable.Type {
        return BackgoundFactoryImplementation.self
    }
}

fileprivate struct topWaveFactory {
    static func create(in signUpView: UIView) -> TopWaveView {
        let topWaveView = TopWaveView()

        signUpView.addSubview(topWaveView)
        topWaveView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                    topWaveView.topAnchor.constraint(equalTo: signUpView.topAnchor),
                    topWaveView.leadingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.leadingAnchor),
                    topWaveView.trailingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.trailingAnchor),
                    topWaveView.heightAnchor.constraint(equalToConstant: 220)
                ])
        

        return topWaveView
    }
}

fileprivate struct bottomWaveFactory{
    static func create(signUpView: UIView) -> BottomWaveView{
        let bottomWaveView = BottomWaveView()

        signUpView.addSubview(bottomWaveView)
        bottomWaveView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                    bottomWaveView.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor),
                    bottomWaveView.leadingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.leadingAnchor),
                    bottomWaveView.trailingAnchor.constraint(equalTo: signUpView.safeAreaLayoutGuide.trailingAnchor),
                    bottomWaveView.heightAnchor.constraint(equalToConstant: 220)
                ])
        

        return bottomWaveView
    }
}

fileprivate struct scrollViewFactory {
    static func create(signUpView: UIView) -> DesignScrollContainerView {
        let scrollContainer = DesignScrollContainerView()
        scrollContainer.translatesAutoresizingMaskIntoConstraints = false
        
        signUpView.addSubview(scrollContainer)
        
        NSLayoutConstraint.activate([
            scrollContainer.topAnchor.constraint(equalTo: signUpView.topAnchor),
            scrollContainer.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor),
            scrollContainer.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor),
            scrollContainer.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor)
        ])
    
        return scrollContainer
    }
}
