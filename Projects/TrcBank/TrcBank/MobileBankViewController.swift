//
//  MobileBankViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/9.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class MobileBankViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = [
        [ "image": "bank_query", "text": "查询服务" ],
        [ "image": "bank_transfer", "text": "转账汇款" ],
        [ "image": "bank_credit_card", "text": "信用卡" ],
        [ "image": "bank_invest", "text": "理财超市" ],
        [ "image": "bank_notice_save", "text": "通知存款" ],
        [ "image": "bank_one_card", "text": "定活互转" ],
        [ "image": "bank_debit_transfer", "text": "跨行转账" ],
        [ "image": "bank_account_mgmt", "text": "账户管理" ],
        [ "image": "bank_user_mgmt", "text": "用户设置" ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        collectionView.registerNib(UINib(nibName: "MenuCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "Cell")
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MenuCollectionViewCell
        let item = items[indexPath.row] as Dictionary<String, String>
        cell.icon.image = UIImage(named: item["image"]!)
        cell.text.text = item["text"]!
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }

}
