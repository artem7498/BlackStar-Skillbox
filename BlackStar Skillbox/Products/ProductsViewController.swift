//
//  ProductsViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/30/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products: [Products] = []
    var productImages: [ProductImages] = []
    var sizes: [SizeOffers] = []
    
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(URLData.shared.productsURL)
        
        if id != "" {
            loadProducts(catID: id) { products in
                self.products = products
                self.collectionView.reloadData()
//                print(products)
//                print(URLData.shared.productsURL)
            }
        } else {return}
        print(id)
//        print(products.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PageViewController, segue.identifier == "Show Product Page", let productInfo = sender as? Products {
            vc.productInfo = productInfo
//            print(productInfo)
        }
    }
    
}


extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = (UIScreen.main.bounds.size.width - 10) / 2
        let h = (UIScreen.main.bounds.size.height - 120) / 2
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show Product Page", sender: products[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductsCollectionViewCell
        
        let product = products[indexPath.row]
        cell.product = product
        
        return cell
    }
    
    
    
}
