//
//  TransDetailListTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class TransDetailListTableViewController: UITableViewController {

    let items = [
        [ "transDate": "2015-09-09", "transTime": "12:35:55", "type": "收入", "bank": "农工商银行西青田丽分理处", "account": "6225****2677", "transAmt": "100.00", "currency": "人民币", "remark": "农信银转账" ],
        [ "transDate": "2015-09-10", "transTime": "09:01:45", "type": "支出", "bank": "农工商银行西青田丽分理处", "account": "6225****2677", "transAmt": "2000.00", "currency": "人民币", "remark": "跨行转账" ],
        [ "transDate": "2015-09-11", "transTime": "07:55:30", "type": "支出", "bank": "农工商银行西青田丽分理处", "account": "6225****2677", "transAmt": "55.00", "currency": "美元", "remark": "国际支付" ],
        [ "transDate": "2015-10-01", "transTime": "03:22:03", "type": "收入", "bank": "农工商银行西青田丽分理处", "account": "6225****2677", "transAmt": "100.00", "currency": "人民币", "remark": "普通贷记往帐" ],
        [ "transDate": "2015-10-02", "transTime": "12:35:55", "type": "收入", "bank": "农工商银行西青田丽分理处", "account": "6225****2677", "transAmt": "100.00", "currency": "人民币", "remark": "普通贷记往帐" ],
    ]
    let labels = [
        "transDate": "交易日期", "transTime": "交易时间", "type": "收入支出", "bank": "交易机构", "account": "对方账号", "transAmt": "交易金额", "currency": "币种", "remark": "摘要"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        ViewUtils.initCustomNavigation(self, title: "交易明细查询")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TransDetailListTableViewCell
        
        cell.lblTransDate.text = items[indexPath.row]["transDate"]!
        cell.lblRemark.text = items[indexPath.row]["remark"]!
        let transAmt = items[indexPath.row]["transAmt"]!
        cell.lblTransAmt.text = "￥\(transAmt)"

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sourceVC = segue.sourceViewController as! TransDetailListTableViewController
        sourceVC.navigationItem.title = ""
        
        let destVC = segue.destinationViewController as! TransDetailInfoTableViewController
        let indexPath = tableView.indexPathForSelectedRow
        
        destVC.item = items[indexPath!.row]
    }

}
