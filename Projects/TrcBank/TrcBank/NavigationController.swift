//
//  ViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logout() {
        let sheetController = UIAlertController(title: nil, message: "您要退出手机银行吗？", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .Default, handler: { UIAlertAction -> Void in
            let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
            delegate.isLogin = false
            
            for viewController in self.viewControllers {
                viewController.navigationItem.rightBarButtonItem = nil
            }
        })
        sheetController.addAction(okAction)
        sheetController.addAction(cancelAction)
        
        self.presentViewController(sheetController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if !delegate.isLogin {
            viewController.navigationItem.rightBarButtonItem = nil
        } else {
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .Plain, target: self, action: "logout")
        }
    }

}
