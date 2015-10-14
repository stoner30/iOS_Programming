//
//  GBNavigationController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class GBNavigationController: UINavigationController, UINavigationControllerDelegate {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation controller delegate
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if !delegate.isLogin {
            viewController.navigationItem.rightBarButtonItem = nil
        } else {
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .Plain, target: self, action: "logout")
        }
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
    
}
