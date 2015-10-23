//
//  ContactListTableViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/22.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework
import xmpp_messenger_ios

private let reuseIdentifier = "OneCellReuse"

class ContactListTableViewController: UITableViewController, OneRosterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        OneRoster.sharedInstance.delegate = self
        
        OneChat.sharedInstance.connect(username: kXMPP.myJID, password: kXMPP.myPassword, completionHandler: { (stream, error) -> Void in
            if let _ = error {
                self.performSegueWithIdentifier("One.HomeToSetting", sender: self)
            } else {
                // set up online UI
            }
        })
    }
    
    override func viewWillDisappear(animated: Bool) {
        OneRoster.sharedInstance.delegate = nil
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func oneRosterContentChanged(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = OneRoster.buddyList.sections
        
        if section < sections!.count {
            let sectionInfo: AnyObject = sections![section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return OneRoster.buddyList.sections!.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = OneRoster.sharedInstance.fetchedResultsController()!.sections
        
        if section < sections!.count {
            let sectionInfo: AnyObject = sections![section]
            let tmpSection: Int = Int(sectionInfo.name)!
            
            switch tmpSection {
            case 0:
                return "Available"
            case 1:
                return "Away"
            default:
                return "Offline"
            }
        }
        
        return ""
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let user = OneRoster.userFromRosterAtIndexPath(indexPath: indexPath)
        
        cell.textLabel?.text = user.displayName
        
        if user.unreadMessages.intValue > 0 {
            cell.backgroundColor = UIColor.orangeColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        OneChat.sharedInstance.configurePhotoForCell(cell, user: user)
        
        return cell
    }

}
