//
//  AccountInfoDetailTableViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class AccountInfoDetailTableViewController: UITableViewController {

    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblOpenDate: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblEnabledBalance: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblAccountStatus: UILabel!
    
    var item: [String: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAccountType.text = item["accountType"]!
        lblAccountNo.text = item["accountNo"]!
        lblBank.text = item["bank"]!
        lblOpenDate.text = item["openDate"]!
        lblCurrency.text = item["currency"]!
        let balance = item["balance"]!
        lblBalance.text = "￥\(balance)"
        let enabledBalance = item["enabledBalance"]!
        lblEnabledBalance.text = "￥\(enabledBalance)"
        lblType.text = item["type"]!
        lblAccountStatus.text = item["accountStatus"]!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        ViewUtils.initCustomNavigation(self, title: "账户详细信息")
    }

}
