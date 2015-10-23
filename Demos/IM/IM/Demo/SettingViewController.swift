//
//  SettingViewController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/22.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit
import XMPPFramework
import xmpp_messenger_ios

class SettingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnValidate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        if OneChat.sharedInstance.isConnected() {
            txtUsername.hidden = true
            txtPassword.hidden = true
            btnValidate.setTitle("Disconnect", forState: .Normal)
        } else {
            if NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myJID) != "kXMPPmyJID" {
                txtUsername.text = NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myJID)
                txtPassword.text = NSUserDefaults.standardUserDefaults().stringForKey(kXMPP.myPassword)
            }
        }
    }
    
    @IBAction func validate(sender: AnyObject) {
        if OneChat.sharedInstance.isConnected() {
            OneChat.sharedInstance.disconnect()
            txtUsername.hidden = false
            txtPassword.hidden = false
            btnValidate.setTitle("Validate", forState: .Normal)
        } else {
            OneChat.sharedInstance.connect(username: self.txtUsername.text!, password: self.txtPassword.text!, completionHandler: { (stream, error) -> Void in
                if let _ = error {
                    let alertController = UIAlertController(title: "Sorry", message: "An error occured: \(error)", preferredStyle: .Alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .Default, handler: { (alertAction) -> Void in
                        // do something
                    })
                    alertController.addAction(alertAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                } else {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dismissKeyboard() {
        if txtUsername.isFirstResponder() {
            txtUsername.resignFirstResponder()
        } else if txtPassword.isFirstResponder() {
            txtPassword.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if txtPassword.isFirstResponder() {
            txtPassword.resignFirstResponder()
            validate(self)
        } else {
            txtUsername.resignFirstResponder()
        }
        return true
    }
    
}
