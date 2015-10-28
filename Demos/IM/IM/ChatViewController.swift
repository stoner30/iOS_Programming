//
//  ChatViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/23.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import CoreData
import XMPPFramework

class ChatViewController: UITableViewController {

    var friendJID: XMPPJID!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNewMessage", name: "DidReceiveNewMessage", object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func handleNewMessage() {
        let context: NSManagedObjectContext = XMPPManager.shareInstance().xmppMessageArchivingCoreDataStorage.mainThreadManagedObjectContext
        let request: NSFetchRequest = NSFetchRequest(entityName: "XMPPMessageArchiving_Message_CoreDataObject")
        let predicate: NSPredicate = NSPredicate(format: "streamBareJidStr = %@ AND bareJidStr = %@", XMPPManager.shareInstance().myJID.bare(), friendJID.bare())
        request.predicate = predicate
        let timeSort: NSSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: true)
        request.sortDescriptors = [timeSort]
        
        let resultController: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        let result = resultController.fetchedObjects
        print("--------------\(result)")
    }

}
