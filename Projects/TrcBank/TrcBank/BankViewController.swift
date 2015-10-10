//
//  BankViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/9.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class BankViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = [
        [ "image": "bank_query", "text": "查询服务" ],
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 1)
        
        collectionView.registerNib(UINib(nibName: "MenuCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "Cell")
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MenuCollectionViewCell
        
        if indexPath.row < items.count {
            let item = items[indexPath.row] as Dictionary<String, String>
            cell.icon.image = UIImage(named: item["image"]!)
            cell.text.text = item["text"]!
        } else {
            cell.icon.image = nil
            cell.text.text = ""
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items.count % 4 == 0 {
            return items.count
        } else {
            return items.count + (4 - items.count % 4)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 2 - 3) / 4
        return CGSize(width: size, height: size)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if !delegate.isLogin {
            if let loginVC = storyboard?.instantiateViewControllerWithIdentifier("LoginNavigationViewController") {
                presentViewController(loginVC, animated: true, completion: nil)
            }
        }
    }

}
