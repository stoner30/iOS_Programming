//
//  TransDetailInfoTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class TransDetailInfoTableViewController: UITableViewController {

    @IBOutlet weak var lblTransDate: UILabel!
    @IBOutlet weak var lblTransTime: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblTransAmt: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    
    var item: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        lblTransDate.text = item["transDate"]!
        lblTransTime.text = item["transTime"]!
        lblType.text = item["type"]!
        lblBank.text = item["bank"]!
        lblAccount.text = item["account"]!
        let transAmt = item["transAmt"]!
        lblTransAmt.text = "￥\(transAmt)"
        lblCurrency.text = item["currency"]!
        lblRemark.text = item["remark"]!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "交易明细查询")
    }

}
