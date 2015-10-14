//
//  BankQueryIndexViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/12.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class IndexViewController: UITableViewController {

    let items = [
        [ "text": "交易明细查询", "storyboard": "TransDetailQuery" ],
        [ "text": "账户信息查询", "storyboard": "AccountInfoQuery" ],
        [ "text": "跨行账户信息查询" ],
        [ "text": "手机日志查询" ]
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
        GBViewHelpers.initCustomNavigation(self, title: "查询服务")
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]["text"]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let storyboardName = items[indexPath.row]["storyboard"] {
            let storyboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
            if let vc = storyboard.instantiateInitialViewController() {
                self.navigationItem.title = ""
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}
