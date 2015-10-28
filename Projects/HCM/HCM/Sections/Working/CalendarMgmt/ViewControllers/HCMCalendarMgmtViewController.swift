//
//  CalendarMgmtViewController.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/26.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit
import FSCalendar

class HCMCalendarMgmtViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var alertTableView: UITableView!
    @IBOutlet weak var transactionTableView: UITableView!
    
    var alertViewController: HCMAlertViewController!
    var transactionViewController: HCMTransactionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarViewController = HCMCalendarViewController()
        calendarView.scrollDirection = .Vertical
        calendarView.dataSource = calendarViewController
        calendarView.delegate = calendarViewController
        
        alertViewController = HCMAlertViewController()
        alertTableView.dataSource = alertViewController
        alertTableView.delegate = alertViewController
        alertViewController.tableView = self.alertTableView
        
        transactionViewController = HCMTransactionViewController()
        transactionTableView.dataSource = transactionViewController
        transactionTableView.delegate = transactionViewController
        transactionViewController.tableView = self.transactionTableView
        
        alertTableView.hidden = true
        transactionTableView.hidden = true
        
        self.addChildViewController(calendarViewController)
        self.addChildViewController(alertViewController)
        self.addChildViewController(transactionViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            calendarView.hidden = false
            alertTableView.hidden = true
            transactionTableView.hidden = true
        case 1:
            calendarView.hidden = true
            alertTableView.hidden = false
            transactionTableView.hidden = true
        default:
            calendarView.hidden = true
            alertTableView.hidden = true
            transactionTableView.hidden = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destViewController = segue.destinationViewController as? UINavigationController {
            if let viewController = destViewController.viewControllers.first as? HCMCalendarEditViewController {
                viewController.calendar = self.calendarView
//                viewController.alertTableView = self.alertTableView
//                viewController.transactionTableView = self.transactionTableView
                viewController.alertViewController = self.alertViewController
                viewController.transactionViewController = self.transactionViewController
            }
        }
    }

}
