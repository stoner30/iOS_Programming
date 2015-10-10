//
//  InfoViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/10.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 1)
        
        collectionView.registerNib(UINib(nibName: "MenuCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        collectionView.collectionViewLayout = layout
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
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 2 - 3) / 4
        return CGSize(width: size, height: size)
    }

}
