//
//  AppDelegate.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/9.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        // 设置TabBar的图片的颜色为红色
        UITabBar.appearance().tintColor = UIColor(red: 255 / 255, green: 58 / 255, blue: 58 / 255, alpha: 1)
        
        // 设置导航栏的背景色为蓝色
        UINavigationBar.appearance().barTintColor = UIColor(red: 119 / 255, green: 136 / 255, blue: 153 / 255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        // 设置导航栏的字体及字体颜色
        if let barFont = UIFont(name: "PingFangSC-Medium", size: 22.0) {
            UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: barFont
            ]
        }
        
        // 设置StatusBarStyle时，一定要保证Info.plist中存在View controller-based status bar appearance = NO的键值，否则不会生效
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

