//
//  GBMenuLayout.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class GBMenuLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        
        self.sectionInset = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
