//
//  NotificationsManager.swift
//  PM Sub Study
//
//  Created by Travis Allen on 12/12/18.
//  Copyright © 2018 Travis Allen. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationsManager {
    
    func createNotification(fireDate: NSDateComponents, notificationBody: String){
        var userCalendar = Calendar.current
        userCalendar.timeZone = TimeZone(abbreviation: "EDT")!
        
        let notificationHeaderTitle = "Precision Medicine Study"
        
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = notificationHeaderTitle
            content.body = notificationBody
            content.sound = UNNotificationSound.default
            
            //making this specific to the daily notification, such that it only has hour and minute
            var date = DateComponents()
            date.hour = fireDate.hour
            date.minute = fireDate.minute
//            date.second = 20
            let trigger = UNCalendarNotificationTrigger(dateMatching: date,
                                                        repeats: true)
            
            let identifier = "UYLLocalNotification"
            let request = UNNotificationRequest(identifier: identifier,
                                                content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.center.add(request, withCompletionHandler: { (error) in
                if let error = error {
                    // Something went wrong
                }
            })
            
        } else {
            // Fallback on earlier versions
            
            let dateToday = Date()
            let day = userCalendar.component(.day, from: dateToday)
            let month = userCalendar.component(.month, from: dateToday)
            let year = userCalendar.component(.year, from: dateToday)
            
            fireDate.day = day
            fireDate.month = month
            fireDate.year = year
            
            let fireDateLocal = userCalendar.date(from:fireDate as DateComponents)
            
            let localNotification = UILocalNotification()
            localNotification.fireDate = fireDateLocal
            localNotification.alertTitle = notificationHeaderTitle
            localNotification.alertBody = notificationBody
            localNotification.timeZone = TimeZone(abbreviation: "EDT")!
            //set the notification
            UIApplication.shared.scheduleLocalNotification(localNotification)
        }
    }
    
    func cancelNotification(fireDate: NSDateComponents) {
        //        let canceledNotifDate = fireDate as! DateComponents
        //
        //        var scheduledNotifications:NSArray? = UIApplication.shared.scheduledLocalNotifications as! NSArray
        //
        //        for scheduledEvent in scheduledNotifications! {
        //            var notification = scheduledEvent as! UILocalNotification
        //
        //            if notification.fireDate == canceledNotifDate {
        //                UIApplication.shared.cancelLocalNotification(notification)
        //                break;
        //            }
        //        }
        
    }
}
