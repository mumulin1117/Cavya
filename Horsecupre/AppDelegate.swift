//
//  AppDelegate.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/10.
//

import UIKit
//import SwiftyStoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
//        SwiftyStoreKit.completeTransactions(atomically: true) { _ in
//            
//        }
      
        ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = (CATIGOVIAArenaPostController.CATIGOVIAlesson == nil) ? CATIGOVIARiderLoginController.init() : CATIGOVIAStableTabBarController.init()
        
        window?.makeKeyAndVisible()
        return true
    }

    
}

