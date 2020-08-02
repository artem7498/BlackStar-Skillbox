//
//  JSONResponse.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/14/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation

struct Category {
    var name: String?
    var image: String?
    var iconImage: String?
    var subcategories: [Subcategory]?
    
    
    init?(data: NSDictionary){
        guard let name = data["name"] as? String,
            let image = data["image"] as? String,
            let iconImage = data["iconImage"] as? String,
            let subCat = data["subcategories"] as? [NSDictionary] else { return nil }
        
        var tempArray = [Subcategory]()
        subCat.forEach { dictItem in
            if let subCategoryItem = Subcategory(data: dictItem){
                tempArray.append(subCategoryItem)
            }
        }
        
        self.name = name
        self.image = image
        self.iconImage = iconImage
        self.subcategories = tempArray
    }
}

struct Subcategory {
    var id: String?
    var iconImage: String?
    var subname: String?
    var type: String?

    init?(data: NSDictionary){
        guard let id = data["id"] as? String,
        let iconImage = data["iconImage"] as? String,
        let name = data["name"] as? String,
        let type = data["type"] as? String else { return nil }
        
        self.id = id
        self.iconImage = iconImage
        self.subname = name
        self.type = type
    }
}
