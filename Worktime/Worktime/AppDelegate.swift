//
//  AppDelegate.swift
//  Worktime
//
//  Created by Daniele Boscolo on 23/01/18.
//  Copyright © 2018 Daniele Boscolo. All rights reserved.
//

import UIKit
import Presentation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var mainCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Configuration.setup()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        mainCoordinator = TestCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        mainCoordinator?.start()

        return true
    }
}
