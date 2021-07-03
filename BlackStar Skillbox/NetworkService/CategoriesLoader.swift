//
//  CategoriesLoader.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/14/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import Alamofire

func loadCategories(completion: @escaping (Result<[Category], Error>) -> Void){
    AF.request(URLData.shared.categoryURL).validate(statusCode: 200..<300).responseJSON { response in
        switch response.result{
        case .success:
            if let objects = response.value,
                let jsonDict = objects as? NSDictionary{
                    DispatchQueue.main.async {
                        let categories = jsonDict.compactMap { _, v in v as? NSDictionary}
                            .compactMap(Category.init)
                        completion(.success(categories))
    //                    print(categories)
                    }
                }
                    print("Validation Successful")
        case let .failure(error):
            completion(.failure(error))
            print("Ошибка при отправке запроса: \(error)")
        }
    }
}

func loadProducts(catID: String, completion: @escaping (Result<[Products], Error>) -> Void){
    AF.request(URLData.shared.productsURL+catID).validate(statusCode: 200..<300).responseJSON { response in
        switch response.result{
        case .success:
            if let objects = response.value,
                let jsonDict = objects as? NSDictionary{
                    DispatchQueue.main.async {
                        let products = jsonDict.compactMap { _, s in s as? NSDictionary}
                            .compactMap(Products.init)
                        completion(.success(products))
    //                    print(products)
    //                    print(response)
                    }
                }
            print("Validation Successful")
        case let .failure(error):
            completion(.failure(error))
            print("Ошибка при отправке запроса: \(error)")
        }
    }
}
