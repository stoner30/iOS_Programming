//
//  TransDetailInfoTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class SQSTDQVDetailViewController: UITableViewController {

    @IBOutlet weak var lblTransDate: UILabel!
    @IBOutlet weak var lblTransTime: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var lblTransAmt: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    
    var model: SQSTDQMModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        lblTransDate.text = model.transDate
        lblTransTime.text = model.transTime
        lblType.text = model.transType
        lblBank.text = model.openDept
        lblAccount.text = model.accountNo
        lblTransAmt.text = model.transAmount
        lblCurrency.text = model.currency
        lblRemark.text = model.transRemark
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "交易明细查询")
    }

}
