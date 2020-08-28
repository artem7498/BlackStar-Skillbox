//
//  SubcategoryTableViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/16/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ShoppingBagViewController: UIViewController {
    
    var shoppingBag = RealmWorkShoppingBag.shared.getItems()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func orderButton(_ sender: Any) {
    }
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    private func reloadData() {
    shoppingBag = RealmWorkShoppingBag.shared.getItems()
    tableView.reloadData()
    }

    // MARK: - Table view data source


}


extension ShoppingBagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingBag.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShoppingBagTableViewCell
        
        let product = shoppingBag[indexPath.row]
        
        cell.productNameLabel.text =  product.name
        cell.productImageView.image = UIImage(named: "Сотовая связь")
        cell.sizeLabel.text = product.size
        cell.priceLabel.text = product.price

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            RealmWorkShoppingBag.shared.remove(index: indexPath.row)
            self.reloadData()
        }
    }
    
    
}
