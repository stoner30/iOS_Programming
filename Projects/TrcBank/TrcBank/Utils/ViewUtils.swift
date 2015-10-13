//
//  ViewUtils.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class ViewUtils: NSObject {
    
    /**
    为每个自定义的ViewController设置标题和导航栏中的注销按钮
    
    - parameter viewController: 待设置的ViewController实例
    - parameter title:          导航栏标题
    
    - returns: Void
    */
    static func initCustomNavigation(viewController: UIViewController, title: String) {
        viewController.navigationItem.title = title
    }
    
}
