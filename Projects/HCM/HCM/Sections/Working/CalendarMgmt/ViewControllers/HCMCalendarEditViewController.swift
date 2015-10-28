//
//  HCMCalendarEditViewController.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/27.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit
import Eureka
import FSCalendar
import EventKit
import SwiftValidators

class HCMCalendarEditViewController: FormViewController {

    var calendar: FSCalendar?
//    var alertTableView: UITableView?
    var alertViewController: HCMAlertViewController?
//    var transactionTableView: UITableView?
    var transactionViewController: HCMTransactionViewController?
    
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form
            +++ Section()
            <<< TextRow("title") {
                $0.placeholder = "标题"
            }.onCellHighlight({ (cell, row) -> () in
                // 必须注册这个事件才能捕获失去焦点时的事件
            }).onCellUnHighlight({ (cell, row) -> () in
                if row.value == nil || Validator.isEmpty(row.value!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())) {
                    cell.backgroundColor = HCMValidationUtil.ErrorColor
                    self.navigationItem.rightBarButtonItem?.enabled = false
                } else {
                    print("Value is: \(row.value!).")
                    cell.backgroundColor = .whiteColor()
                    self.navigationItem.rightBarButtonItem?.enabled = true
                }
            })
            <<< TextAreaRow("notes") {
                $0.placeholder = "备注"
            }
            +++ Section()
            <<< DateTimeInlineRow("startDate") {
                $0.title = "开始时间"
                $0.value = NSDate()
                $0.dateFormatter = HCMDateUtil.getDefaultFormatter()
            }.onChange({ [weak self] row in
                if let endRow: DateTimeInlineRow = self?.form.rowByTag("endDate") {
                    if row.value?.compare(endRow.value!) == .OrderedDescending {
                        endRow.value = NSDate(timeInterval: 60 * 60 * 24, sinceDate: row.value!)
                        endRow.cell!.backgroundColor = .whiteColor()
                        endRow.updateCell()
                    }
                }
            })
            <<< DateTimeInlineRow("endDate") {
                $0.title = "结束时间"
                $0.value = NSDate(timeInterval: 60 * 60 * 24, sinceDate: NSDate())
                $0.dateFormatter = HCMDateUtil.getDefaultFormatter()
            }.onChange({ [weak self] row in
                if let startRow: DateTimeInlineRow = self?.form.rowByTag("startDate") {
                    if row.value?.compare(startRow.value!) == .OrderedAscending {
                        row.cell!.backgroundColor = HCMValidationUtil.ErrorColor
                        self?.navigationItem.rightBarButtonItem?.enabled = false
                    } else {
                        row.cell!.backgroundColor = .whiteColor()
                        self?.navigationItem.rightBarButtonItem?.enabled = true
                    }
                    row.updateCell()
                }
            })
            <<< SegmentedRow<String>("calendar") {
                $0.title = "事件类型"
                $0.options = [ "提醒", "事务" ]
                $0.value = "提醒"
            }
            <<< PushRow<AlertTimes>("alarm") {
                $0.title = "提醒"
                $0.options = AlertTimes.allValues
                $0.value = .Never
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func close(sender: UIBarButtonItem) {
        if sender == btnDone {
            let event = EKEvent(eventStore: HCMEventKitUtil.shareInstance())
            
            event.title = form.values()["title"] as! String
            event.notes = form.values()["notes"] as? String
            event.startDate = form.values()["startDate"] as! NSDate
            event.endDate = form.values()["endDate"] as! NSDate
            
            let cal = form.values()["calendar"] as! String
            event.calendar = cal == "提醒" ? HCMEventKitUtil.calendarAlert : HCMEventKitUtil.calendarTransaction
            
            if let alert = form.values()["alarm"] as? AlertTimes {
                switch alert {
                case .Never:
                    break
                default:
                    event.alarms = [EKAlarm(absoluteDate: NSDate(timeInterval: alert.rawValue, sinceDate: event.startDate))]
                }
            }
            
            do {
                try HCMEventKitUtil.shareInstance().saveEvent(event, span: EKSpan.ThisEvent, commit: true)
            } catch {
                print(error)
            }
        }
        
        dismissViewControllerAnimated(true) { () -> Void in
            if sender == self.btnDone {
                self.calendar?.reloadData()
                
                self.alertViewController?.loadEvent()
                self.alertViewController?.tableView.reloadData()
                
                self.transactionViewController?.loadEvent()
                self.transactionViewController?.tableView.reloadData()
            }
        }
    }

}

enum AlertTimes: NSTimeInterval, CustomStringConvertible {
    case Never = -1
    case AtTimeOfEvent = 0
    case FiveMinutes = -300
    case FifteenMinutes = -900
    case HalfHour = -1800
    case OneHour = -3600
    case TwoHour = -7200
    case OneDay = -86400
    case TwoDays = -172800
    
    var description: String {
        switch self {
        case .Never: return "无"
        case .AtTimeOfEvent: return "事件发生时"
        case .FiveMinutes: return "5分钟前"
        case .FifteenMinutes: return "15分钟前"
        case .HalfHour: return "30分钟前"
        case .OneHour: return "1小时前"
        case .TwoHour: return "2小时前"
        case .OneDay: return "1天前"
        case .TwoDays: return "2天前"
        }
    }
    
    static let allValues = [Never, AtTimeOfEvent, FiveMinutes, FifteenMinutes, HalfHour, OneHour, TwoHour, OneDay, TwoDays]
}
