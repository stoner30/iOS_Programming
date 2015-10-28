//
//  EventKitUtil.swift
//  EventKitDemo
//
//  Created by Stoner Wang on 15/10/26.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import EventKit
import UIKit
import EventKitUI

class EventStoreUtil {
    
    private struct Singleton {
        static var predicate: dispatch_once_t = 0
        static var instance: EKEventStore? = nil
    }
    
    class func initEventStore() {
        if EventStoreUtil.Singleton.instance == nil {
            dispatch_once(&Singleton.predicate) { () -> Void in
                // 初始化EKEventStore
                Singleton.instance = EKEventStore()
            }
            
            // 向用户申请访问事件的授权
            Singleton.instance!.requestAccessToEntityType( EKEntityType.Event) { (grant, error) -> Void in
                if grant {
                    print("获取访问授权")
                } else {
                    print("拒绝访问")
                }
            }
        }
    }
    
    class func shareEventStore() -> EKEventStore {
        if Singleton.instance == nil {
            initEventStore()
        }
        
        return Singleton.instance!
    }
    
    class func releaseEventStore() {
        Singleton.instance = nil
    }
    
    class func fetchEvents() {
        let calendar = NSCalendar.currentCalendar()
        
        // 创建起始时间
        let oneDayAgoComponents = NSDateComponents()
        oneDayAgoComponents.day = -1
        let oneDayAgo = calendar.dateByAddingComponents(oneDayAgoComponents, toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))
        
        // 创建截止时间
        let oneYearFromNowComponets = NSDateComponents()
        oneYearFromNowComponets.year = 1
        let oneYearFromNow = calendar.dateByAddingComponents(oneYearFromNowComponets, toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))
        
        let predicate = Singleton.instance?.predicateForEventsWithStartDate(oneDayAgo!, endDate: oneYearFromNow!, calendars: nil)
        
        // 获取记录
        // 获取记录的操作默认是同步操作，官方文档提示，不希望将这个操作放入主队列中，需要使用NSOperation来进行异步调用
        // TODO: 了解iOS多线程操作
        if let events = Singleton.instance?.eventsMatchingPredicate(predicate!) {
            print("\(events.count) Result(s): ")
            for i in 0..<events.count {
                print("\(i):\t\(events[i].title)")
            }
        }
    }
    
    class func createEvent() {
        let event = EKEvent(eventStore: Singleton.instance!)
        event.title = "帮老婆还信用卡"
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        event.startDate = formatter.dateFromString("2015-10-28 09:30:00")!
        event.endDate = formatter.dateFromString("2015-10-28 09:40:00")!
        
        // 一定要设置calendar属性，否则会在保存时提示no calendar has been set
        event.calendar = Singleton.instance!.defaultCalendarForNewEvents
        
        do {
            try Singleton.instance!.saveEvent(event, span: EKSpan.ThisEvent, commit: true)
        } catch {
            print("\(error)")
        }
    }
    
    class func removeEvent {
        
    }
    
}
