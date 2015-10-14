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

    var isLogin: Bool = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let layout = GBMenuLayout()
        
        let menusBank = [
            [ "image": "bank_query", "text": "查询服务", "storyboard": "Index" ],
            [ "image": "bank_transfer", "text": "转账汇款" ],
            [ "image": "bank_credit_card", "text": "信用卡" ],
            [ "image": "bank_invest", "text": "理财超市" ],
            [ "image": "bank_notice_save", "text": "通知存款" ],
            [ "image": "bank_one_card", "text": "定活互转" ],
            [ "image": "bank_fund", "text": "基金" ],
            [ "image": "bank_debit_transfer", "text": "跨行收款" ],
            [ "image": "bank_account_mgmt", "text": "账户管理" ],
            [ "image": "bank_user_mgmt", "text": "用户设置" ]
        ]
        let vcBank = GBMenuViewController(collectionViewLayout: layout, menus: menusBank)
        let navBank = GBNavigationController(rootViewController: vcBank)
        navBank.tabBarItem = UITabBarItem(title: "手机银行", image: UIImage(named: "bar_bank"), tag: 0)
        
        let menusService = [
            [ "image": "services_tv", "text": "电视缴费" ],
            [ "image": "services_phone", "text": "固话缴费" ],
            [ "image": "services_no_card", "text": "无卡购电" ],
            [ "image": "services_mobile", "text": "手机充值" ],
            [ "image": "services_game", "text": "游戏充值" ],
            [ "image": "services_water", "text": "代缴水费" ],
            [ "image": "services_plane", "text": "机票预订" ],
            [ "image": "services_traffic", "text": "乘车预定" ],
            [ "image": "services_hotel", "text": "酒店预订" ],
            [ "image": "services_movie", "text": "电影票" ]
        ]
        let vcService = GBMenuViewController(collectionViewLayout: layout, menus: menusService)
        let navService = GBNavigationController(rootViewController: vcService)
        navService.tabBarItem = UITabBarItem(title: "生活服务", image: UIImage(named: "bar_service"), tag: 1)
        
        let menusHelper = [
            [ "image": "helper_save_cal", "text": "存款计算" ],
            [ "image": "helper_save_rate", "text": "存款利率" ],
            [ "image": "helper_loan_cal", "text": "贷款计算" ],
            [ "image": "helper_loan_rate", "text": "贷款利率" ],
            [ "image": "helper_house_loan", "text": "房贷计算" ],
            [ "image": "helper_foreign_currency", "text": "外汇计算" ],
            [ "image": "helper_map_query", "text": "网点查询" ],
            [ "image": "helper_qrcode", "text": "回单验证" ]
        ]
        let vcHelper = GBMenuViewController(collectionViewLayout: layout, menus: menusHelper)
        let navHelper = GBNavigationController(rootViewController: vcHelper)
        navHelper.tabBarItem = UITabBarItem(title: "金融助手", image: UIImage(named: "bar_helper"), tag: 2)
        
        let menusInfo = [
            [ "image": "info_standard", "text": "资费标准" ],
            [ "image": "info_manual", "text": "操作指南" ],
            [ "image": "info_biz_intro", "text": "业务介绍" ],
            [ "image": "info_faq", "text": "常见问题" ],
            [ "image": "info_security", "text": "安全功能" ],
            [ "image": "info_contact_us", "text": "联系我们" ],
            [ "image": "info_news", "text": "最新公告" ],
            [ "image": "info_activity", "text": "优惠活动" ],
            [ "image": "info_site", "text": "农商官网" ]
        ]
        let vcInfo = GBMenuViewController(collectionViewLayout: layout, menus: menusInfo)
        let navInfo = GBNavigationController(rootViewController: vcInfo)
        navInfo.tabBarItem = UITabBarItem(title: "农商资讯", image: UIImage(named: "bar_info"), tag: 3)
        
        let tabVC = UITabBarController()
        tabVC.viewControllers = [navBank, navService, navHelper, navInfo]
        
        window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = tabVC
        window?.addSubview(tabVC.view)
        window?.makeKeyAndVisible()
        
        // 设置TabBar的图片的颜色为橙色
        UITabBar.appearance().tintColor = UIColor(red: 234 / 255, green: 87 / 255, blue: 4 / 255, alpha: 1)
        
        // 设置导航栏的背景色为橙色
        UINavigationBar.appearance().barTintColor = UIColor(red: 234 / 255, green: 87 / 255, blue: 4 / 255, alpha: 1)
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

