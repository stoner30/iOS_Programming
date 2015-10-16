//
//  GBAccountInfoViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/16.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class GBAccountInfoViewController: UIViewController {

    var selectedAccountInfo: MAccountInfo?
    
    @IBOutlet weak var txtAccountInfo: UITextField!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    init() {
        super.init(nibName: "GBAccountInfoViewController", bundle: NSBundle.mainBundle())
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
    
    @IBAction func pressOnBtnSelect(sender: UIButton) {
        let accountInfos = GBAccountInfoHelpers.getAccountInfos()
        let pickerRows = accountInfos.map({ $0.accountName + "/" + $0.accountAlias! })
        let pickerView = ActionSheetStringPicker(title: nil, rows: pickerRows, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            self.selectedAccountInfo = accountInfos[index]
            self.txtAccountInfo.text = pickerRows[index]
            
            print(self.selectedAccountInfo)
            
            self.lblAccountNo.text = self.selectedAccountInfo!.accountNo
            self.lblCurrency.text = self.selectedAccountInfo!.currency
            self.lblBalance.text = self.selectedAccountInfo!.balance
        }, cancelBlock: {
            picker in return
        }, origin: self.view.superview?.superview)

        pickerView.setCancelButton(UIBarButtonItem(title: "取消", style: .Plain, target: nil, action: nil))
        pickerView.setDoneButton(UIBarButtonItem(title: "确定", style: .Plain, target: nil, action: nil))
        
        pickerView.showActionSheetPicker()
    }

}
