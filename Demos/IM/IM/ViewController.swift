//
//  ViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/22.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let customToolbarController = CustomToolbarController()
        let customToolbar = customToolbarController.view
//        customToolbar.frame = CGRectMake(0, 0, self.view.bounds.width, 44)
        
        let toolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.height - 44, self.view.bounds.width, 44))
        toolbar.addSubview(customToolbarController.view)
        customToolbar.frame = toolbar.bounds
        
        self.view.addSubview(toolbar)
        self.addChildViewController(customToolbarController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissKeyboard() {
        resignFirstResponder()
    }

}

