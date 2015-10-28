//
//  ViewController.swift
//  EventKitDemo
//
//  Created by Stoner Wang on 15/10/26.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("[Before]--------------------------------")
        EventStoreUtil.fetchEvents()
        EventStoreUtil.createEvent()
        print("[After]--------------------------------")
        EventStoreUtil.fetchEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

