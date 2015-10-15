//
//  SQSAIQMModel.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/15.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import Foundation

struct SQSAIQMModel {
    
    var accountType: String
    var accountNo: String
    var openDept: String
    var openDate: String
    var currency: String
    var balance: String
    var enabledBalance: String
    var currencyFlag: String
    var accountStatus: String
    
    init(accountType: String, accountNo: String, openDept: String, openDate: String, currency: String, balance: String, enabledBalance: String, currencyFlag: String, accountStatus: String) {
        
        self.accountType = accountType
        self.accountNo = accountNo
        self.openDept = openDept
        self.openDate = openDate
        self.currency = currency
        self.balance = "￥\(balance)"
        self.enabledBalance = "￥\(enabledBalance)"
        self.currencyFlag = currencyFlag
        self.accountStatus = accountStatus
        
    }
    
    static func getMockModels() -> [SQSAIQMModel] {
        return [
            SQSAIQMModel(accountType: "借记卡", accountNo: "6231***9654", openDept: "农商银行西青田丽分理处", openDate: "2015-06-29", currency: "人民币", balance: "3056.31", enabledBalance: "22.58", currencyFlag: "钞", accountStatus: "正常"),
            SQSAIQMModel(accountType: "信用卡", accountNo: "6231***7056", openDept: "农商银行西青田丽分理处", openDate: "2015-09-10", currency: "人民币/美元", balance: "-6755.03", enabledBalance: "-6755.03", currencyFlag: "钞", accountStatus: "正常")
        ]
    }
    
}
