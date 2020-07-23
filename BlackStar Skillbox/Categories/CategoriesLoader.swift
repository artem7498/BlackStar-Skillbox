//
//  CategoriesLoader.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/14/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import Alamofire

func loadCategories(completion: @escaping ([Category]) -> Void){
    AF.request(URLData.shared.categoryURL).responseJSON { response in
        if let objects = response.value,
            let jsonDict = objects as? NSDictionary{
                DispatchQueue.main.async {
                    let categories = jsonDict.compactMap { _, v in v as? NSDictionary}
                        .compactMap(Category.init)
                    completion(categories)
                }
            }
    }
}
