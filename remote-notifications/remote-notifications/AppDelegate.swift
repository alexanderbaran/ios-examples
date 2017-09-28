//
//  AppDelegate.swift
//  remote-notifications
//
//  Created by Alexander Baran on 28/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseMessaging
import UserNotifications

// https://stackoverflow.com/questions/22736913/push-notification-vs-web-sockets-for-implementing-a-real-time-chat-app

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    
    // https://stackoverflow.com/questions/40746232/firebase-cannot-assign-value-of-type-appdelegate-to-type-unusernotification
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        FirebaseApp.configure()

        // https://eladnava.com/send-push-notifications-to-ios-devices-using-xcode-8-and-swift-3/
        
        // iOS 10 support
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().delegate = self
            let authorizationOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(options: authorizationOptions) { (granted, error) in
                if error != nil {
                    print("Failed to allow notifications:", error!)
                }
                print("Granted notifications:", granted)
                
            }
            application.registerForRemoteNotifications()
        }
//        // iOS 9 support.
//        else if #available(iOS 9, *) {
//            let userNotificationTypes: UIUserNotificationType = [.alert, .badge, .sound]
//            let userNotificationSettings = UIUserNotificationSettings(types: userNotificationTypes, categories: nil)
//            application.registerUserNotificationSettings(userNotificationSettings)
//            application.registerForRemoteNotifications()
//        }
        
        return true
    }
    
    // Called when APNs failed to register the device for push notifications.
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // Print the error to console (you should alert the user that registration failed)
        print("APNs registration failed: \(error)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(token)
        // Persist it in your backend in case it's new.
        
        /*
         The registration token may change when:
         
         The app is restored on a new device
         The user uninstalls/reinstall the app
         The user clears app data.
         
         Note that the device token may change in the future due to various reasons, so use NSUserDefaults, a local key-value store, to persist the token locally and only update your backend when the token has changed, to avoid unnecessary requests.
         
         
         */

    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        /* Note that this callback will only be invoked whenever the user has either clicked or swiped to interact with your push notification from the lock screen / Notification Center, or if your app was open when the push notification was received by the device. */
        
        print(userInfo)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

