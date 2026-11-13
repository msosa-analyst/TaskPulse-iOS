//
//  SceneDelegate.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 11/11/26.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appRouter: AppRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let navigationController = UINavigationController()
        appRouter = AppRouter(navigationController: navigationController)
        appRouter?.start()

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
