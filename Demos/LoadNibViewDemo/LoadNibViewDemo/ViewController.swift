//
//  ViewController.swift
//  LoadNibViewDemo
//
//  Created by Stoner Wang on 15/10/11.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var referencedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let views1 = NSBundle.mainBundle().loadNibNamed("View1", owner: nil, options: nil)
        let view1 = views1.last as! UIView
        var r = view1.frame
        r.origin.y += 80
        view1.frame = r
            
        self.view.addSubview(view1)
        
        let views2 = NSBundle.mainBundle().loadNibNamed("View2", owner: self, options: nil)
        let view2 = views2.last as! UIView
        r = referencedView.frame
        r.origin.y = view1.frame.size.height + view1.frame.origin.y
        view2.frame = r
            
        self.view.addSubview(view2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

