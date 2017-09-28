//
//  ViewController.swift
//  notifications
//
//  Created by Alexander Baran on 27/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    lazy var notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show notification", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(handleNotification), for: .touchUpInside)
        return button
    }()
    
    @objc func handleNotification() {
        
        let answer1 = UNNotificationAction(identifier: "answer1", title: "365", options: .foreground)
        let answer2 = UNNotificationAction(identifier: "answer2", title: "340", options: .foreground)
        
        let category = UNNotificationCategory(identifier: "myCategory", actions: [answer1, answer2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = "How many days are there in one year?"
        content.subtitle = "Do you know?"
        content.body = "Do you really know, and this is the body!"
        content.categoryIdentifier = "myCategory"
        // This is just to display the icon badge. The icon of the app in our notification.
        content.badge = 1
        
        // In order to show the notification we need a trigger that will trigger the notfication.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        // When testing the notification need to press home button to get out of the app, or else the notification won't show.
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                print("Could not show notification:", error!)
            }
            print("Notification successfully shown.")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "answer1" {
            print("Corrent answer.")
        } else {
            print("Wrong answer.")
        }
        // Call this to prevent warnings.
        completionHandler()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(notificationButton)
        notificationButton.anchorCenterSuperview()
        
        // We want to be able to display alert, sound, and badge, badge can be app icon.
        // https://developer.apple.com/documentation/usernotifications/unauthorizationoptions
        // Will only see the message once. Once it is allowed, won't see it again.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow: Bool, error: Error?) in
            // Check if user did allow etc.
        }
        UNUserNotificationCenter.current().delegate = self
    }
    
}
















