//
//  FileOwner.swift
//  LoadNibViewDemo
//
//  Created by Stoner Wang on 15/10/12.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class FileOwner: NSObject {

    @IBOutlet weak var view: UIView!
    
    static func viewFromNibNamed(nibName: String) -> UIView {
        let fileOwner = FileOwner()
        NSBundle.mainBundle().loadNibNamed(nibName, owner: fileOwner, options: nil)
        return fileOwner.view
    }
    
}
