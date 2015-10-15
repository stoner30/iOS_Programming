//
//  AccountInfoPreTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SQSAIQVListViewController: UITableViewController {

    let models = SQSAIQMModel.getMockModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "账户信息查询")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SQSAIQVListViewCell
        
        let model = models[indexPath.row]
        
        cell.lblAccountType.text = model.accountType
        cell.lblAccountNo.text = model.accountNo
        cell.lblEnabledBalance.text = model.enabledBalance
        
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destViewController = segue.destinationViewController as? SQSAIQVDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let model = models[indexPath.row]
                destViewController.model = model
            }
        }
    }

}
