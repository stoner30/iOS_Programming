//
//  ViewUtils.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/13.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class GBViewHelpers: NSObject {
    
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

class GBMenuHelpers: NSObject {
    
    private static func getMenus(dicMenus: [[String: AnyObject]]) -> [MMenu] {
        var menus = [MMenu]()
        for dicMenu in dicMenus {
            if let dicSubMenus = dicMenu["subMenus"] {
                var subMenus = [MMenu]()
                for dicSubMenu in dicSubMenus as! [[String: AnyObject]] {
                    subMenus.append(MMenu(name: dicSubMenu["name"] as! String, storyboardName: dicSubMenu["storyboardName"] as? String))
                }
                menus.append(MMenu(image: dicMenu["image"] as! String, name: dicMenu["name"] as! String, subMenus: subMenus))
            } else {
                menus.append(MMenu(image: dicMenu["image"] as! String, name: dicMenu["name"] as! String))
            }
        }
        return menus
    }
    
    static func getMenusOfBank() -> [MMenu] {
        let dicMenus: [[String: AnyObject]] = [
            [
                "image": "bank_query", "name": "查询服务",
                "subMenus": [
                    [ "name": "交易明细查询", "storyboardName": "SQSTDQC_UI" ],
                    [ "name": "账户信息查询", "storyboardName": "SQSAIQ" ],
                    [ "name": "跨行账户信息查询" ],
                    [ "name": "手机日志查询" ]
                ]
            ],
            [ "image": "bank_transfer", "name": "转账汇款" ],
            [ "image": "bank_credit_card", "name": "信用卡" ],
            [ "image": "bank_invest", "name": "理财超市" ],
            [ "image": "bank_notice_save", "name": "通知存款" ],
            [ "image": "bank_one_card", "name": "定活互转" ],
            [ "image": "bank_fund", "name": "基金" ],
            [ "image": "bank_debit_transfer", "name": "跨行收款" ],
            [ "image": "bank_account_mgmt", "name": "账户管理" ],
            [ "image": "bank_user_mgmt", "name": "用户设置" ]
        ]
        return getMenus(dicMenus)
    }
    
    static func getMenusOfService() -> [MMenu] {
        let dicMenus: [[String: AnyObject]] = [
            [ "image": "services_tv", "name": "电视缴费" ],
            [ "image": "services_phone", "name": "固话缴费" ],
            [ "image": "services_no_card", "name": "无卡购电" ],
            [ "image": "services_mobile", "name": "手机充值" ],
            [ "image": "services_game", "name": "游戏充值" ],
            [ "image": "services_water", "name": "代缴水费" ],
            [ "image": "services_plane", "name": "机票预订" ],
            [ "image": "services_traffic", "name": "乘车预定" ],
            [ "image": "services_hotel", "name": "酒店预订" ],
            [ "image": "services_movie", "name": "电影票" ]
        ]
        return getMenus(dicMenus)
    }
    
    static func getMenusOfHelper() -> [MMenu] {
        let dicMenus: [[String: AnyObject]] = [
            [ "image": "helper_save_cal", "name": "存款计算" ],
            [ "image": "helper_save_rate", "name": "存款利率" ],
            [ "image": "helper_loan_cal", "name": "贷款计算" ],
            [ "image": "helper_loan_rate", "name": "贷款利率" ],
            [ "image": "helper_house_loan", "name": "房贷计算" ],
            [ "image": "helper_foreign_currency", "name": "外汇计算" ],
            [ "image": "helper_map_query", "name": "网点查询" ],
            [ "image": "helper_qrcode", "name": "回单验证" ]
        ]
        return getMenus(dicMenus)
    }
    
    static func getMenusOfInfo() -> [MMenu] {
        let dicMenus: [[String: AnyObject]] = [
            [ "image": "info_standard", "name": "资费标准" ],
            [ "image": "info_manual", "name": "操作指南" ],
            [ "image": "info_biz_intro", "name": "业务介绍" ],
            [ "image": "info_faq", "name": "常见问题" ],
            [ "image": "info_security", "name": "安全功能" ],
            [ "image": "info_contact_us", "name": "联系我们" ],
            [ "image": "info_news", "name": "最新公告" ],
            [ "image": "info_activity", "name": "优惠活动" ],
            [ "image": "info_site", "name": "农商官网" ]
        ]
        return getMenus(dicMenus)
    }
    
}

class GBAccountInfoHelpers {
    
    static func getAccountInfos() -> [MAccountInfo] {
        return [
            MAccountInfo(accountNo: "6223299901201509396", currency: "人民币", currencyFlag: "钞"),
            MAccountInfo(accountNo: "6223010039569984190", currency: "美元", currencyFlag: "汇")
        ]
    }
    
}
