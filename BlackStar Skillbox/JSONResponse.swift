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
//    var subcategories: [Subcategories]

    init?(data: NSDictionary){
        guard let name = data["name"] as? String,
            let image = data["image"] as? String else { return nil }
        self.name = name
        self.image = image
    }
}

struct Subcategories {
    var iconImage: String?
    var name: String?

    init?(data: NSDictionary){
        guard let subcategories = data["subcategories"] as? [NSDictionary],
        let iconImage = subcategories[0]["iconImage"] as? String,
        let name = subcategories[0]["name"] as? String else { return nil }
        self.iconImage = iconImage
        self.name = name
    }
}

//struct CategoryCode: Decodable{
//    var categories: [Category]
//}

//struct Category: Decodable{
//    var name: String?
//    var image: String?
//    var iconImage: String?
//
//    private enum MainKeys: String, CodingKey {
//        case name
//        case image
//        case iconImage
//    }
//
//    init (from decoder: Decoder) throws {
//        if let categoryContainer = try? decoder.container(keyedBy: MainKeys.self){
//            self.name = try categoryContainer.decode(String.self, forKey: .name)
//            self.image = try categoryContainer.decode(String.self, forKey: .image)
//            self.iconImage = try categoryContainer.decode(String.self, forKey: .iconImage)
//        }
//    }
//}

