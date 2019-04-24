//
//  AppDelegate.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootController = UINavigationController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(rootViewController: rootController)
        
        self.window?.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        
        self.appCoordinator?.start()
        
        return true
    }

}
