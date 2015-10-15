//
//  MAccountInfo.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/15.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import Foundation

struct MAccountInfo {
    
    var accountNo: String
    var currency: String
    var currencyFlag: String
    
    init(accountNo: String, currency: String, currencyFlag: String) {
        self.accountNo = accountNo
        self.currency = currency
        self.currencyFlag = currencyFlag
    }
    
}
