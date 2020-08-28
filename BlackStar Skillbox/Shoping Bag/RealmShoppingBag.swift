//
//  RealmShoppingBag.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/28/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift

class ShoppingBag: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    @objc dynamic var article = ""
    @objc dynamic var size = ""
    
}
