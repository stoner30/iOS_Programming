//
//  SMTUVPreViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/16.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

private let reuseIdentifier = "Cell"

class SMTUVPreViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var txtOperators: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtTopupAmount: UITextField!
    @IBOutlet weak var lblTransAmount: UILabel!
    
    let operatorNames = [
        [
            "operatorName": "移动",
            "topUpAmounts": [
                [ "label": "10元", "value": "￥10.30" ],
                [ "label": "20元", "value": "￥20.30" ],
                [ "label": "50元", "value": "￥50.30" ]
            ]
        ],
        [
            "operatorName": "联通",
            "topUpAmounts": [
                [ "label": "10元", "value": "￥10.10" ],
                [ "label": "20元", "value": "￥20.10" ],
                [ "label": "30元", "value": "￥30.10" ]
            ]
        ],
        [
            "operatorName": "电信",
            "topUpAmounts": [
                [ "label": "10元", "value": "￥10.00" ],
                [ "label": "20元", "value": "￥20.00" ]
            ]
        ]
    ]
    
    var model: SMTUMModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        txtOperators.delegate = self
        txtTopupAmount.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "手机充值")
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
            
            let accountInfoViewController = GBAccountInfoViewController()
            accountInfoViewController.view.frame = cell.contentView.bounds
            
            cell.selectionStyle = .None
            cell.contentView.addSubview(accountInfoViewController.view)
            self.addChildViewController(accountInfoViewController)
            
            return cell
        }
        
        return super.tableView(tableView, cellForRowAtIndexPath: indexPath)
    }

    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 140
        }
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    // MARK: - Text field delegate
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField == txtOperators {
            let pickerRows = self.operatorNames.map({ $0["operatorName"]! })
            let pickerView = ActionSheetStringPicker(title: nil, rows: pickerRows, initialSelection: 0, doneBlock: {
                picker, index, value in
                
                self.txtOperators.text = pickerRows[index] as? String
                self.txtTopupAmount.text = ""
                self.lblTransAmount.text = ""
            }, cancelBlock: {
                picker in return
            }, origin: self.view.superview?.superview)
            
            pickerView.setCancelButton(UIBarButtonItem(title: "取消", style: .Plain, target: nil, action: nil))
            pickerView.setDoneButton(UIBarButtonItem(title: "确定", style: .Plain, target: nil, action: nil))
            
            pickerView.showActionSheetPicker()
        }
        
        if textField == txtTopupAmount {
            var pickerRows: [String] = []
            if let operatorName = self.txtOperators.text {
                switch operatorName {
                case "移动":
                    pickerRows = (self.operatorNames[0]["topUpAmounts"] as! [[String: String]]).map({ $0["label"]! })
                case "联通":
                    pickerRows = (self.operatorNames[1]["topUpAmounts"] as! [[String: String]]).map({ $0["label"]! })
                default:
                    pickerRows = (self.operatorNames[2]["topUpAmounts"] as! [[String: String]]).map({ $0["label"]! })
                }
            }
            
            let pickerView = ActionSheetStringPicker(title: nil, rows: pickerRows, initialSelection: 0, doneBlock: {
                picker, index, value in
                
                self.txtTopupAmount.text = pickerRows[index]
                if let operatorName = self.txtOperators.text {
                    switch operatorName {
                    case "移动":
                        let transAmount = (self.operatorNames[0]["topUpAmounts"] as! [[String: String]])[index]["value"]
                        self.lblTransAmount.text = transAmount
                    case "联通":
                        let transAmount = (self.operatorNames[1]["topUpAmounts"] as! [[String: String]])[index]["value"]
                        self.lblTransAmount.text = transAmount
                    default:
                        let transAmount = (self.operatorNames[2]["topUpAmounts"] as! [[String: String]])[index]["value"]
                        self.lblTransAmount.text = transAmount
                    }
                }
            }, cancelBlock: {
                picker in return
            }, origin: self.view.superview?.superview)
            
            pickerView.setCancelButton(UIBarButtonItem(title: "取消", style: .Plain, target: nil, action: nil))
            pickerView.setDoneButton(UIBarButtonItem(title: "确定", style: .Plain, target: nil, action: nil))
            
            pickerView.showActionSheetPicker()
        }
        
        return false
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        txtPhoneNumber.resignFirstResponder()
    }

}
