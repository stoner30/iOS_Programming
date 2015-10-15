//
//  AccountInfoDetailTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class SQSAIQVDetailViewController: UITableViewController {

    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblOpenDate: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblEnabledBalance: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblAccountStatus: UILabel!
    
    var model: SQSAIQMModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAccountType.text = model.accountType
        lblAccountNo.text = model.accountNo
        lblBank.text = model.openDept
        lblOpenDate.text = model.openDate
        lblCurrency.text = model.currency
        lblBalance.text = model.balance
        lblEnabledBalance.text = model.enabledBalance
        lblType.text = model.currencyFlag
        lblAccountStatus.text = model.accountStatus
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "账户详细信息")
    }

}
