//
//  AppDelegate.swift
//  RM
//
//  Created by Импрув on 19.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private var applicationAssembley = ApplicationAssembley.shared
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let applicationCoordinator = applicationAssembley.resolver.resolve(ApplicationCoordinator.self)
        applicationCoordinator?.start()
        return true
    }
}
