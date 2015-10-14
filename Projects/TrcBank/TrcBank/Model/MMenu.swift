//
//  MMenu.swift
//  TrcBank
//
//  Created by Stoner Wang on 15/10/14.
//  Copyright © 2015年 Stoner.Wong. All rights reserved.
//

import Foundation

struct MMenu {
    
    var image: String?
    var name: String
    var haveSubMenu: Bool = false
    var subMenus: [MMenu]?
    var storyboardName: String?
    
    init(image: String, name: String) {
        self.image = image
        self.name = name
    }
    
    init(name: String, storyboardName: String?) {
        self.name = name
        self.storyboardName = storyboardName
    }
    
    init(image: String, name: String, subMenus: [MMenu]) {
        self.image = image
        self.name = name
        self.haveSubMenu = true
        self.subMenus = subMenus
    }
    
    mutating func addSubMenu(subMenu: MMenu) {
        if subMenus == nil {
            subMenus = [subMenu]
        } else {
            subMenus?.append(subMenu)
        }
    }
    
    mutating func addSubMenus(subMenus: [MMenu]) {
        if self.subMenus == nil {
            self.subMenus = subMenus
        } else {
            self.subMenus! += subMenus
        }
    }
    
}
