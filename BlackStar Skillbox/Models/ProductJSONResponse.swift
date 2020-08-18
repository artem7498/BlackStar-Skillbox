//
//  ProductJSONResponse.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/30/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation

struct Products {
    
    var name: String?
    var article: String?
//    var collection: String?
    var description: String?
    var colorName: String?
    var mainImage: String?
    var productImages: [ProductImages]?
    var sizes: [SizeOffers]?
    var price: String?
    
    init?(data: NSDictionary){
        guard let name = data["name"] as? String,
            let article = data["article"] as? String,
//            let collection = data["collection"] as? String,
            let description = data["description"] as? String,
            let colorName = data["colorName"] as? String,
            let mainImage = data["mainImage"] as? String,
            let productImages = data["productImages"] as? [NSDictionary],
            let sizes = data["offers"] as? [NSDictionary],
            let price = data["price"] as? String else { return nil }
        
        var tempArray = [ProductImages]()
        productImages.forEach { dictItem in
            if let prodImages = ProductImages(data: dictItem){
                tempArray.append(prodImages)
                print(tempArray)
            }
        }
        
        
        var sizeArray = [SizeOffers]()
        sizes.forEach { dictItem in
            if let sizeOffers = SizeOffers(data: dictItem) {
                sizeArray.append(sizeOffers)
            }
        }
    
        self.name = name
        self.article = article
//        self.collection = collection
        self.description = description
        self.colorName = colorName
        self.mainImage = mainImage
        self.productImages = tempArray
        self.sizes = sizeArray
        self.price = price
        
    }
}

struct ProductImages {
    
    var imageURL: String?
    var sortOrder: String?
    
    init?(data: NSDictionary){
        guard let imageURL = data["imageURL"] as? String,
            let sortOrder = data["sortOrder"] as? String else { return nil }
        
        self.imageURL = imageURL
        self.sortOrder = sortOrder
    }
}

struct SizeOffers {
    
    var size: String?
    var productOfferID: String?
    var quantity: String?
    
    init?(data: NSDictionary){
        guard let size = data["size"] as? String,
            let productOfferID = data["productOfferID"] as? String,
            let quantity = data["quantity"] as? String else { return nil }
        
        self.size = size
        self.productOfferID = productOfferID
        self.quantity = quantity
    }
}










