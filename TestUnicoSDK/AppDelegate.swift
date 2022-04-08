//
//  AppDelegate.swift
//  TestUnicoSDK
//
//  Created by Ronald de Souza Maciel on 06/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navController = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = navController
        
        window?.makeKeyAndVisible()
        return true
    }
}
