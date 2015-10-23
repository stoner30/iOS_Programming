//
//  CustomToolbarController.swift
//  IM
//
//  Created by Stoner Wang on 15/10/22.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class CustomToolbarController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnVoice: UIButton!
    @IBOutlet weak var btnText: UIButton!
    @IBOutlet weak var btnVoiceInput: UIButton!
    @IBOutlet weak var txtTextInput: UITextField!
    
    init() {
        super.init(nibName: "CustomToolbarController", bundle: NSBundle.mainBundle())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnVoice.backgroundColor = UIColor.whiteColor()
        btnVoice.tintColor = UIColor.lightGrayColor()
        btnVoice.layer.cornerRadius = btnVoice.bounds.width / 2.0
        
        btnText.backgroundColor = UIColor.whiteColor()
        btnText.tintColor = UIColor.lightGrayColor()
        btnText.layer.cornerRadius = btnVoice.bounds.width / 2.0
        
        btnText.hidden = true
        txtTextInput.hidden = true
        
        txtTextInput.delegate = self
        
        btnVoiceInput.layer.borderWidth = 0.5
        btnVoiceInput.layer.borderColor = UIColor(red: 0.87, green: 0.87, blue: 0.87, alpha: 1).CGColor
        btnVoiceInput.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressOnButton(sender: UIButton) {
        if sender == btnVoice {
            btnVoice.hidden = true
            btnText.hidden = false
            btnVoiceInput.hidden = true
            txtTextInput.hidden = false
        } else {
            btnText.hidden = true
            btnVoice.hidden = false
            txtTextInput.hidden = true
            btnVoiceInput.hidden = false
        }
    }
    
    var alert: UIAlertController!
    
    @IBAction func touchDownOnBtnVoice(sender: UIButton) {
        alert = UIAlertController(title: "录音中...", message: "手指上划，取消发送", preferredStyle: .Alert)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpInsideOnBtnVoice(sender: UIButton) {
        alert.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func touchUpOutsideOnBtnVoice(sender: UIButton) {
        alert.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
