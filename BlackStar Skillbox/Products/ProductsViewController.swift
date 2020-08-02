//
//  ProductsViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/30/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    static let sharedd = ProductsViewController()
    
    var products: [Products] = []
    var productImages: [ProductImages] = []
    var sizes: [SizeOffers] = []
    
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(URLData.shared.productsURL)
        
        if id != "" {
        loadProducts{ products in
            self.products = products
//            self.tableView.reloadData()
            print(products)
            print(URLData.shared.productsURL)
        }
        } else {return}
        print(id)

        // Do any additional setup after loading the view.
    }
    
}


extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = (UIScreen.main.bounds.size.width - 10) / 2
        let h = (UIScreen.main.bounds.size.height - 120) / 2
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
//        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductsCollectionViewCell
        
        cell.productImage.image = UIImage(named: "Сотовая связь")
        cell.productName.text =  "No name"
        cell.productPrice.text = "2600 руб"
        
        return cell
    }
    
    
    
    
    
    
    
    
    
}
