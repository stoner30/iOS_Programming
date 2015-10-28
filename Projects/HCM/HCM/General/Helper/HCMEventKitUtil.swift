//
//  HCMEventKitUtil.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/27.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import Foundation
import EventKit

class HCMEventKitUtil {

    private static let TITLE_CALENDAR_ALERT = "HCM-提醒"
    private static let TITLE_CALENDAR_TRANSACTION = "HCM-事务"
    
//    private static let TARGET_SOURCE_TITLE = "iCloud"
    private static let TARGET_SOURCE_TITLE = "Default"
    
    static var calendarAlert: EKCalendar!
    static var calendarTransaction: EKCalendar!
    
    class func initEventStore() {
        shareInstance()
        
        let calendars = shareInstance().calendarsForEntityType(EKEntityType.Event)
        
        let _ = calendars.map({ (calendar: EKCalendar) -> Void in
            if calendar.title == self.TITLE_CALENDAR_ALERT {
                calendarAlert = calendar
            }
        })
        
        let _ = calendars.map({ (calendar: EKCalendar) -> Void in
            if calendar.title == self.TITLE_CALENDAR_TRANSACTION {
                calendarTransaction = calendar
            }
        })
        
        do {
            var selectedSource: EKSource!
            
            for source: EKSource in shareInstance().sources {
                // 模拟器上使用Default，真机使用iCloud
                if source.title == TARGET_SOURCE_TITLE {
                    selectedSource = source
                }
            }
            
            if calendarAlert == nil {
                calendarAlert = EKCalendar(forEntityType: EKEntityType.Event, eventStore: shareInstance())
                calendarAlert.title = TITLE_CALENDAR_ALERT
                calendarAlert.source = selectedSource
                try shareInstance().saveCalendar(calendarAlert, commit: true)
            }
            
            if calendarTransaction == nil {
                calendarTransaction = EKCalendar(forEntityType: EKEntityType.Event, eventStore: shareInstance())
                calendarTransaction.title = TITLE_CALENDAR_TRANSACTION
                calendarTransaction.source = selectedSource
                try shareInstance().saveCalendar(calendarTransaction, commit: true)
            }
        } catch {
            print(error)
        }
    }
    
    class func shareInstance() -> EKEventStore {
        struct Singleton {
            static var predicate: dispatch_once_t = 0
            static var instance: EKEventStore? = nil
        }
        
        dispatch_once(&Singleton.predicate) { () -> Void in
            Singleton.instance = EKEventStore()
        }
        
        Singleton.instance?.requestAccessToEntityType(.Event, completion: { (grant, error) -> Void in
            if error != nil {
                print(error)
            }
        })
        
        return Singleton.instance!
    }
    
    class func fetchEventsFrom(fromDate: NSDate, to toDate: NSDate) -> [EKEvent] {
        // 如果无参数，默认查询当前时间及以后所有的事件
        let predicate = shareInstance().predicateForEventsWithStartDate(fromDate, endDate: toDate, calendars: [ calendarAlert, calendarTransaction ])
        return shareInstance().eventsMatchingPredicate(predicate)
    }
    
    class func fetchAlertsFrom(fromDate: NSDate, to toDate: NSDate) -> [EKEvent] {
        let predicate = shareInstance().predicateForEventsWithStartDate(fromDate, endDate: toDate, calendars: [calendarAlert])
        return shareInstance().eventsMatchingPredicate(predicate)
    }
    
    class func fetchTransactionsFrom(fromDate: NSDate, to toDate: NSDate) -> [EKEvent] {
        let predicate = shareInstance().predicateForEventsWithStartDate(fromDate, endDate: toDate, calendars: [calendarTransaction])
        return shareInstance().eventsMatchingPredicate(predicate)
    }
    
}
