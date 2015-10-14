//
//  GBMenuViewController.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GBMenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var menus: [[String: String]]!
    
    init(collectionViewLayout layout: UICollectionViewLayout, menus: [[String: String]]) {
        super.init(collectionViewLayout: layout)
        self.menus = menus
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.registerNib(UINib(nibName: "GBMenuCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        ViewUtils.initCustomNavigation(self, title: "农商银行")
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if menus.count % 4 == 0 {
            return menus.count
        } else {
            return menus.count + (4 - menus.count % 4)
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! GBMenuCell
        
        if indexPath.row < menus.count {
            let menu = menus[indexPath.row]
            cell.icon.image = UIImage(named: menu["image"]!)
            cell.text.text = menu["text"]!
        } else {
            cell.icon.image = nil
            cell.text.text = ""
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row < menus.count
    }

    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.row < menus.count
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if !delegate.isLogin {
            self.navigationItem.title = ""
            
            let loginVC = GBLoginViewController(nibName: "GBLoginViewController", bundle: NSBundle.mainBundle())
            navigationController?.pushViewController(loginVC, animated: true)
        } else {
            // TODO: 判断是否存在二级菜单，如果存在就初始化二级菜单的TabViewController，否则直接跳转至相应的Storyboard
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 2 - 3) / 4
        return CGSize(width: size, height: size + 16)
    }
    
}
