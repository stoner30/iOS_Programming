//
//  ServicesViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/10.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let items = [
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
