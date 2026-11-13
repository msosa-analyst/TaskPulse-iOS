//
//  AppRouter.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 12/11/26.
//

import UIKit

final class AppRouter: Router {
    
    let navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func start() {
        let initialVC = LoginModuleBuilder.build(navigationController: navigationController)
        navigationController.setViewControllers([initialVC], animated: false)
    }

    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func present(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
}
