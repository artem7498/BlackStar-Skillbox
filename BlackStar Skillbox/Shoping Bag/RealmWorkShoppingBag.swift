//
//  RealmWorkShoppingBag.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/28/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWorkShoppingBag {
    
    static let shared = RealmWorkShoppingBag()
    
    private let realm = try! Realm()
    
      func getItems() -> Results<ShoppingBag>{
          realm.objects(ShoppingBag.self)
      }
      
    func save(name: String, price: String, article: String, size: String) {
          let bag = ShoppingBag()
        bag.name = name
        bag.price = price
        bag.article = article
        bag.size = size
          try! realm.write {
              realm.add(bag)
          }
      }
         
      func remove(index: Int){
          let product = realm.objects(ShoppingBag.self)[index]
          try! realm.write {
              realm.delete(product)
          }
      }
    
    
    
    
    
    
    
    
}
