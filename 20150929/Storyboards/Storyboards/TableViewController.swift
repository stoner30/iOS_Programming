//
//  TableViewController.swift
//  Storyboards
//
//  Created by Stoner Wang on 15/9/29.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    点击TableView中Cell时的事件，根据行索引的不同，选择加载哪个Storyboard
    
    - parameter tableView: tableView
    - parameter indexPath: indexPath
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let firstDetail = UIStoryboard(name: "FirstDetail", bundle: NSBundle.mainBundle())
            if let vc = firstDetail.instantiateInitialViewController() {
                navigationController?.pushViewController(vc, animated: true)
            }
        default:
            let secondDetail = UIStoryboard(name: "SecondDetail", bundle: NSBundle.mainBundle())
            if let vc = secondDetail.instantiateInitialViewController() {
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}
