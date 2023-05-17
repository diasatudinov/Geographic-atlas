//
//  Notification.swift
//  Geographic atlas
//
//  Created by Atudinov Dias on 17.05.2023.
//

import SwiftUI
import UserNotifications

func notificate(title: String, subtitle: String){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
        if success{
            print("Notification on its way")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
    
    let content = UNMutableNotificationContent()
    content.title = "\(title) is a capital of which country?"
    content.subtitle = "Yes, this is the capital of \(subtitle). Let's go learn the capitals of the world"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}
