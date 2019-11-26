//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Alexander Serdobintsev on 11/26/19.
//  Copyright © 2019 Alexander Serdobintsev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let navigationController = UINavigationController()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
        -> Bool {

        window = UIWindow()

        let configurator = CharacterListConfigurator()
        let view = configurator.configure()
        navigationController.viewControllers = [view]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
