//
//  TransDetailListTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SQSTDQVListViewController: UITableViewController {

    let models = SQSTDQMModel.getMockModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "交易明细查询")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SQSTDQVListViewCell
        
        let model = models[indexPath.row]
        
        cell.lblTransDate.text = model.transDate
        cell.lblRemark.text = model.transRemark
        cell.lblTransAmt.text = model.transAmount

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! SQSTDQVDetailViewController
        let indexPath = tableView.indexPathForSelectedRow
        
        destViewController.model = models[indexPath!.row]
    }

}
