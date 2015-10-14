//
//  AccountInfoPreTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class AccountInfoListTableViewController: UITableViewController {

    let items = [
        [ "accountType": "借记卡", "accountNo": "6231***9654", "bank": "农商银行西青田丽分理处", "openDate": "2015-06-29", "currency": "人民币", "balance": "3056.31", "enabledBalance": "22.58", "type": "钞", "accountStatus": "正常" ],
        [ "accountType": "信用卡", "accountNo": "6231***7056", "bank": "农商银行西青田丽分理处", "openDate": "2015-09-10", "currency": "人民币/美元", "balance": "-6755.03", "enabledBalance": "-6755.03", "type": "钞", "accountStatus": "正常" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        ViewUtils.initCustomNavigation(self, title: "账户信息查询")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AccountInfoListTableViewCell
        
        let item = items[indexPath.row]
        
        cell.lblAccountType.text = item["accountType"]!
        cell.lblAccountNo.text = item["accountNo"]!
        let enabledBalance = item["enabledBalance"]!
        cell.lblEnabledBalance.text = "￥\(enabledBalance)"
        
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.title = ""
        
        if let destViewController = segue.destinationViewController as? AccountInfoDetailTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let item = items[indexPath.row]
                destViewController.item = item
            }
        }
    }

}
