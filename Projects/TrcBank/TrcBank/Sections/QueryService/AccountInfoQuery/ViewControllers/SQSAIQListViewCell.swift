//
//  AccountInfoTableViewCell.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class AccountInfoListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAccountType: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblEnabledBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
