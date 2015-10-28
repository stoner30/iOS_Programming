//
//  HCMMessageViewController.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/28.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit

class HCMMessageViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.tabBarItem.badgeValue = "15"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
