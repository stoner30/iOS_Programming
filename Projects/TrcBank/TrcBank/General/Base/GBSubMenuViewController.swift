//
//  GBSubMenuViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

private let reuseIdentifier: String = "Cell"

class GBSubMenuViewController: UITableViewController {

    var subMenus: [MMenu]!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, subMenus: [MMenu]) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.subMenus = subMenus
        self.view = self.tableView
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subMenus.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = subMenus[indexPath.row].name
        cell.textLabel?.textColor = UIColor.grayColor()
        cell.accessoryType = .DisclosureIndicator
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subMenu = subMenus[indexPath.row]
        if let storyboardName = subMenu.storyboardName {
            let storyboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
            if let viewController = storyboard.instantiateInitialViewController() {
                viewController.navigationItem.title = subMenu.name
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }

}
