//
//  LoginViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/10.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class GBLoginViewController: UIViewController {

    @IBOutlet weak var txtAccount: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRandomCode: UITextField!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        GBViewHelpers.initCustomNavigation(self, title: "农商银行")
    }
    
    /**
    点击屏幕任意位置，隐藏软键盘的方法
    注意，在为UIView绑定该事件之前，一定要在Storyboard中将UIView的Class指定为UIControl，否则无法绑定点击事件
    
    - parameter sender: UIView
    */
    @IBAction func dismissKeyboard(sender: AnyObject) {
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to: nil, from: nil, forEvent: nil)
    }
    
    @IBAction func login(sender: UIButton) {
        // 硬编码登录验证，随后应替换为访问服务器进行登录
        if txtAccount.text == "" {
            showValidationMessage("用户名不能为空")
            return
        }
        
        if txtPassword.text == "" {
            showValidationMessage("密码不能为空")
            return
        }
        
        if txtRandomCode.text == "" {
            showValidationMessage("验证码不能为空")
            return
        }
        
        if txtRandomCode.text != "2222" {
            showValidationMessage("验证码错误，请重新输入")
            return
        }
        
        if txtAccount.text != "Admin" || txtPassword.text != "123456" {
            showValidationMessage("用户名或密码错误")
            return
        }
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        delegate.isLogin = true
        
//        self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationController?.popViewControllerAnimated(true)
//        self.navigationController?.viewControllers.removeLast()
    }
    
    func showValidationMessage(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

}
