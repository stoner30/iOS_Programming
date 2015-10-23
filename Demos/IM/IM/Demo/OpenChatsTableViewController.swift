//
//  OpenChatsTableViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/22.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework
import xmpp_messenger_ios

private let reuseIdentifier = "OneCellReuse"

class OpenChatsTableViewController: UITableViewController, OneRosterDelegate {

    var chatList = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OneChats.getChatsList().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        let user = OneChats.getChatsList().objectAtIndex(indexPath.row) as! XMPPUserCoreDataStorageObject
        
        cell.textLabel?.text = user.displayName
        OneChat.sharedInstance.configurePhotoForCell(cell, user: user)
        
        cell.imageView?.layer.cornerRadius = 24
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func oneRosterContentChanged(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }

}
