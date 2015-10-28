//
//  LoginViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/23.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginSuccess", name: "DidLogin", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func login(sender: AnyObject) {
        if txtUsername.text == "" || txtPassword.text == "" {
            return
        }
        
        XMPPManager.shareInstance().loginWithName(txtUsername.text!, andPassword: txtPassword.text!)
    }
    
    func loginSuccess() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
