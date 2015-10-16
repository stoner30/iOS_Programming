//
//  SMTUMModel.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/16.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import Foundation

struct SMTUMModel {
    
    var accountNo: String
    var operatorName: String
    var phoneNumber: String
    var topUpAmount: String
    var transAmount: String
    
    init(accountNo: String, operatorName: String, phoneNumber: String, topUpAmount: String, transAmount: String) {
        self.accountNo = accountNo
        self.operatorName = operatorName
        self.phoneNumber = phoneNumber
        self.topUpAmount = topUpAmount
        self.transAmount = transAmount
    }
    
}
