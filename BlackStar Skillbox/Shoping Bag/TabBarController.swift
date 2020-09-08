//
//  TabBarController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 9/7/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let myBadgeValue = RealmWorkShoppingBag.shared.getItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        badgeValueUpdate()
    }
    
    
    func badgeValueUpdate() {
        self.tabBar.items![1].badgeValue = "\(myBadgeValue.count)"
    }

}
