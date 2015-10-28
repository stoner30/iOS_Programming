//
//  HCMAlertTableViewController.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/28.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit
import EventKit

class HCMAlertViewController: UITableViewController {

    var items: [EKEvent]!
    
    init() {
        super.init(style: .Plain)
        loadEvent()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadEvent() {
        // 默认查询自当前时间其前后3个月的记录
        let startDate = NSDate(timeIntervalSinceNow: -60 * 60 * 24 * 30)
        let endDate = NSDate(timeIntervalSinceNow: 60 * 60 * 24 * 30)

        items = HCMEventKitUtil.fetchAlertsFrom(startDate, to: endDate)
    }

    // MARK: - TableView Data Source
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alertCell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].notes
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

}
