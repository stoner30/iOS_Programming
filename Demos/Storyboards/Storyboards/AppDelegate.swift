//
//  AppDelegate.swift
//  Storyboards
//
//  Created by Stoner Wang on 15/9/29.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        // 手动创建Window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 手动创建一个TabBarController，并实例化相应的TabBarItem
        let tabBarController = UITabBarController()

        let firstTab = UIStoryboard(name: "FirstTab", bundle: NSBundle.mainBundle())
        let firstNavigationController = firstTab.instantiateInitialViewController()!
        firstNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .Favorites, tag: 0)
        
        let secondTab = UIStoryboard(name: "SecondTab", bundle: NSBundle.mainBundle())
        let secondViewController = secondTab.instantiateInitialViewController()!
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .History, tag: 1)
        
        tabBarController.viewControllers = [firstNavigationController, secondViewController]
        tabBarController.selectedIndex = 1
        
        window?.rootViewController = tabBarController
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

