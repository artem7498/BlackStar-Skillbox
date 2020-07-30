//
//  ProductsViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/30/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    static let shared = ProductsViewController()
    
    var products: [Products] = []
    var id = 311
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts { products in
            self.products = products
//            self.tableView.reloadData()
            print(products)
        }

        // Do any additional setup after loading the view.
    }
    
}
