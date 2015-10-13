//
//  TabViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/10.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        if let vcs = self.viewControllers {
            for index in 0..<vcs.count {
                let nav = vcs[index] as! UINavigationController
                let vc = nav.viewControllers[0] as! MenuViewController
                switch index {
                case 0:
                    vc.items = [
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
                case 1:
                    vc.items = [
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
                case 2:
                    vc.items = [
                        [ "image": "helper_save_cal", "text": "存款计算" ],
                        [ "image": "helper_save_rate", "text": "存款利率" ],
                        [ "image": "helper_loan_cal", "text": "贷款计算" ],
                        [ "image": "helper_loan_rate", "text": "贷款利率" ],
                        [ "image": "helper_house_loan", "text": "房贷计算" ],
                        [ "image": "helper_foreign_currency", "text": "外汇计算" ],
                        [ "image": "helper_map_query", "text": "网点查询" ],
                        [ "image": "helper_qrcode", "text": "回单验证" ]
                    ]
                default:
                    vc.items = [
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
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
