//
//  HCMCalendarViewController.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/28.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit
import FSCalendar

class HCMCalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Calendar Delegate
    
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        let startDate = date
        let endDate = HCMDateUtil.defaultDateFromString("\(date.fs_year)-\(date.fs_month)-\(date.fs_day) 23:59:59")!
        
        let events = HCMEventKitUtil.fetchEventsFrom(startDate, to: endDate)
        return events.count > 0
    }

}
