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
        
        // 首先，View2.xib文件中，File's Owner处设置成了ViewController，再从xib文件中将View与File's Owner中的referencedView关联起来
        // 这样，在加载xib时，View中的视图元素就会自动和ViewController中的IBOutlet变量关联并实例化
        let views2 = NSBundle.mainBundle().loadNibNamed("View2", owner: self, options: nil)  // owner参数要设置成self
        let view2 = views2.last as! UIView
        r = referencedView.frame
        r.origin.y = view1.frame.size.height + view1.frame.origin.y
        view2.frame = r
        
        self.view.addSubview(view2)
        
        // 这个类似于上一个，只是把File's Owner设置成了FileOwner
        let fileOwner = FileOwner()
        let views3 = NSBundle.mainBundle().loadNibNamed("View3", owner: fileOwner, options: nil)
        let view3 = views3.last as! UIView
        r = fileOwner.view.frame
        r.origin.y = view2.frame.size.height + view2.frame.origin.y
        view3.frame = r
        
        self.view.addSubview(view3)
        
        // 又是类似上面的操作，只不过做了些封装
        let view4 = loadFromNibNamed("View4")
        r = view4.frame
        r.origin.y = view3.frame.size.height + view3.frame.origin.y
        view4.frame = r
        
        self.view.addSubview(view4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFromNibNamed(nibName: String) -> UIView {
        return FileOwner.viewFromNibNamed(nibName)
    }

}

