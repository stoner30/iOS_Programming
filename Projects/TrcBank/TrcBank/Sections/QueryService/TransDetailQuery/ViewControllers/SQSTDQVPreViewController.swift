//
//  BankQueryTransDetailPreViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/12.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class SQSTDQVPreViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var btnAccountSelect: UIButton!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    @IBOutlet weak var txtStartDate: UITextField!
    @IBOutlet weak var txtEndDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtStartDate.delegate = self
        txtEndDate.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "交易明细查询")
    }
    
    @IBAction func pressOnBtnAccountSelect(sender: AnyObject) {
        let accountInfos = GBAccountInfoHelpers.getAccountInfos()
        
        let pickerRows = accountInfos.map({
            accountInfo in
            return accountInfo.accountNo
        })
        
        let picker = ActionSheetStringPicker(title: "请选择账号", rows: pickerRows, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            let accountInfo = accountInfos[index]
            
            self.txtAccount.text = accountInfo.accountNo
            self.lblCurrency.text = "币种：\(accountInfo.currency)"
            self.lblType.text = "钞汇类型：\(accountInfo.currencyFlag)"
        }, cancelBlock: {
            picker in return
        }, origin: self.view.superview!.superview)
        
        picker.setDoneButton(UIBarButtonItem(title: "完成", style: .Plain, target: nil, action: nil))
        picker.setCancelButton(UIBarButtonItem(title: "取消", style: .Plain, target: nil, action: nil))
        
        picker.showActionSheetPicker()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let title = textField == txtStartDate ? "请选择起始日期" : "请选择截止日期"
        let selectedDate = textField == txtStartDate ? NSDate(timeIntervalSinceNow: -60 * 60 * 24 * 2) : NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let picker = ActionSheetDatePicker(title: title, datePickerMode: .Date, selectedDate: selectedDate, doneBlock: {
            picker, value, index in
            if let dateValue = value as? NSDate {
                textField.text = formatter.stringFromDate(dateValue)
            }
        }, cancelBlock: {
            picker in return
        }, origin: self.view.superview!.superview)
        
        picker.setDoneButton(UIBarButtonItem(title: "完成", style: .Plain, target: nil, action: nil))
        picker.setCancelButton(UIBarButtonItem(title: "取消", style: .Plain, target: nil, action: nil))
        
        picker.showActionSheetPicker()
        
        return false
    }

}
