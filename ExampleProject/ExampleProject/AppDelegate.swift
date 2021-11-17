//
//  AppDelegate.swift
//  ExampleProject
//
//  Created by Laud Bruce on 09/11/2021.
//

import UIKit
import AppruveiOSSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Appruve.initialize(apiKey: "YOUR_API_TOKEN", isGhanaEnabled: true, isNigeriaEnabled: true, isKenyaEnabled: true, primaryBrandColor: "#69298a", secondaryBrandColor: "#F49600", transactionReference: "", isDocumentCaptureRetryEnabled: true, isDocumentCaptureOnly: false, isSelfieCaptureOnly: false, isGhanaVoterIDEnabled: true, isGhanaPassportIDEnabled: true, isGhanaDriverLicenseIDEnabled: true, isGhanaSSNITIDEnabled: true, isNigeriaVoterIDEnabled: true, isNigeriaPassportIDEnabled: true, isNigeriaDriverLicenseIDEnabled: true, isNigeriaNationalIDEnabled: true, isKenyaNationalIDEnabled: true, isKenyaPassportIDEnabled: false )
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

