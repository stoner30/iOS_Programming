//
//  AppDelegate.swift
//  HCM
//
//  Created by Stoner Wang on 15/10/26.
//  Copyright © 2015年 COFCO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 初始化EventStore
        HCMEventKitUtil.initEventStore()
        
        // 代码创建TabBarController
        let messagesStoryboard = UIStoryboard(name: "Messages", bundle: NSBundle.mainBundle())
        let navMessagesSection = messagesStoryboard.instantiateInitialViewController() as! UINavigationController
        navMessagesSection.tabBarItem = UITabBarItem(title: "消息", image: UIImage(named: "tab-messages"), tag: 0)
        
        let workingStoryboard = UIStoryboard(name: "Working", bundle: NSBundle.mainBundle())
        let navWorkingSection = workingStoryboard.instantiateInitialViewController() as! UINavigationController
        navWorkingSection.tabBarItem = UITabBarItem(title: "工作", image: UIImage(named: "tab-working"), tag: 1)
        
        let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: NSBundle.mainBundle())
        let navContactsSection = contactsStoryboard.instantiateInitialViewController() as! UINavigationController
        navContactsSection.tabBarItem = UITabBarItem(title: "联系人", image: UIImage(named: "tab-contacts"), tag: 2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navMessagesSection, navWorkingSection, navContactsSection]
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = tabBarController
        window?.addSubview(tabBarController.view)
        
        window?.makeKeyAndVisible()
        
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

