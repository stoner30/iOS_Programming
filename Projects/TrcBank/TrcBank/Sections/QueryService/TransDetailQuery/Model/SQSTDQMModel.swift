//
//  SQSTDQModel.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/15.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import Foundation

struct SQSTDQMModel {
    
    var transDate: String
    var transTime: String
    var transType: String
    var openDept: String
    var accountNo: String
    var transAmount: String
    var currency: String
    var transRemark: String?
    
    init(transDate: String, transTime: String, transType: String, openDept: String, accountNo: String, transAmount: String, currency: String) {
        self.transDate = transDate
        self.transTime = transTime
        self.transType = transType
        self.openDept = openDept
        self.accountNo = accountNo
        self.transAmount = "￥\(transAmount)"
        self.currency = currency
    }
    
    init(transDate: String, transTime: String, transType: String, openDept: String, accountNo: String, transAmount: String, currency: String, transRemark: String) {
        self.init(transDate: transDate, transTime: transTime, transType: transType, openDept: openDept, accountNo: accountNo, transAmount: transAmount, currency: currency)
        self.transRemark = transRemark
    }
    
    static func getMockModels() -> [SQSTDQMModel] {
        return [
            SQSTDQMModel(transDate: "2015-09-09", transTime: "12:35:55", transType: "收入", openDept: "农商银行西青田丽分理处", accountNo: "6225****2677", transAmount: "100.00", currency: "人民币", transRemark: "农信银转账"),
            SQSTDQMModel(transDate: "2015-09-10", transTime: "09:01:45", transType: "支出", openDept: "农商银行西青田丽分理处", accountNo: "6225****2677", transAmount: "2000.00", currency: "人民币", transRemark: "跨行转账"),
            SQSTDQMModel(transDate: "2015-09-11", transTime: "07:55:30", transType: "支出", openDept: "农商银行西青田丽分理处", accountNo: "6225****2677", transAmount: "55.00", currency: "美元", transRemark: "国际支付"),
            SQSTDQMModel(transDate: "2015-10-01", transTime: "03:22:03", transType: "收入", openDept: "农商银行西青田丽分理处", accountNo: "6225****2677", transAmount: "100.00", currency: "人民币", transRemark: "普通贷记往帐"),
            SQSTDQMModel(transDate: "2015-10-02", transTime: "12:35:55", transType: "收入", openDept: "农商银行西青田丽分理处", accountNo: "6225****2677", transAmount: "100.00", currency: "人民币", transRemark: "普通贷记往帐")
        ]
    }
    
}
