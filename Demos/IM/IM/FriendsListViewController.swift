//
//  FriendsListViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/23.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework

class FriendsListViewController: UITableViewController {

    var friendsLis = [XMPPUserMemoryStorageObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取服务器好友列表
        XMPPManager.shareInstance().xmppRoster.fetchRoster()
        
        // 监听好友变化
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rosterChange", name: "RosterChanged", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 更新好友
    
    func rosterChange() {
        self.friendsLis = XMPPManager.shareInstance().xmppRosterMemoryStorage.unsortedUsers() as! [XMPPUserMemoryStorageObject]
        tableView.reloadData()
    }
    
    // MARK: - table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendsLis.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendsListCell", forIndexPath: indexPath)
        
        let user = self.friendsLis[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "user_icon")
        cell.textLabel?.text = user.jid().user
        
        if user.isOnline() {
            cell.detailTextLabel?.text = "[在线]"
        } else {
            cell.detailTextLabel?.text = "[离线]"
        }
        
        return cell
    }
    
}
