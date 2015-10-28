//
//  HCMDateUtil.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/28.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import Foundation

class HCMDateUtil {
    
    class func getFormatter(pattern: String) -> NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = pattern
        formatter.locale = NSLocale(localeIdentifier: "zh_CN")
        return formatter
    }
    
    class func getDefaultFormatter() -> NSDateFormatter {
        return getFormatter("yyyy-MM-dd HH:mm:ss")
    }
    
    class func dateFromString(str: String, pattern: String) -> NSDate? {
        return getFormatter(pattern).dateFromString(str)
    }
    
    class func defaultDateFromString(str: String) -> NSDate? {
        return getDefaultFormatter().dateFromString(str)
    }
    
    class func stringFromDate(date: NSDate, pattern: String) -> String {
        return getFormatter(pattern).stringFromDate(date)
    }
    
    class func defaultStringFromDate(date: NSDate) -> String {
        return getDefaultFormatter().stringFromDate(date)
    }
    
}
