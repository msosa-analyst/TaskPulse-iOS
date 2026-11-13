//
//  Router.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

protocol Router: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
