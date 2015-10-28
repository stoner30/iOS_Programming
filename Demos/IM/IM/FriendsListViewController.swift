//
//  FriendsListViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/23.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework
import CoreData

class FriendsListViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var friendsList = [XMPPUserCoreDataStorageObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取服务器好友列表
        XMPPManager.shareInstance().xmppRoster.fetchRoster()
        
        // 监听好友变化
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rosterChange", name: "RosterChanged", object: nil)
        rosterChange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        // 检查登录状态，若用户未登录，则弹出登录窗口
        if let jid = XMPPManager.shareInstance().myJID {
            print(jid.bare())
        } else {
            if let vc = storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") {
                presentViewController(vc, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - 更新好友
    
    func rosterChange() {
        let context: NSManagedObjectContext = XMPPManager.shareInstance().xmppRosterCoreDataStorage.mainThreadManagedObjectContext
        
        let request: NSFetchRequest = NSFetchRequest(entityName: "XMPPUserCoreDataStorageObject")
        
        let predicate: NSPredicate = NSPredicate(format: "streamBareJidStr = %@", XMPPManager.shareInstance().xmppStream.myJID.bare())
        request.predicate = predicate
        
        let sort: NSSortDescriptor = NSSortDescriptor(key: "displayName", ascending: true)
        request.sortDescriptors = [sort]
        
        let resultsController: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: request
            , managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        resultsController.delegate = self
        do {
            try resultsController.performFetch()
        } catch {
            print(error)
        }
        
        
        self.friendsList = XMPPManager.shareInstance().xmppRosterMemoryStorage.unsortedUsers() as! [XMPPUserMemoryStorageObject]
        tableView.reloadData()
    }
    
    // MARK: - table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsListCell", forIndexPath: indexPath)
        
        let user = self.friendsList[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "user_icon")
        cell.textLabel?.text = user.jid().user
        
        if user.isOnline() {
            cell.detailTextLabel?.text = "[在线]"
        } else {
            cell.detailTextLabel?.text = "[离线]"
        }
        
        return cell
    }
    
    // MARK: - navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destViewController = segue.destinationViewController as? ChatViewController {
            let friend = self.friendsList[tableView.indexPathForSelectedRow!.row]
            destViewController.friendJID = friend.jid()
        }
    }
    
}
