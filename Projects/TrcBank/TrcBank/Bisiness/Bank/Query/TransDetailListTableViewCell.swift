//
//  TransDetailListTableViewCell.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class TransDetailListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTransDate: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    @IBOutlet weak var lblTransAmt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
