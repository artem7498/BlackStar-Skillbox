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
    
    let emptyLabel = UILabel()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func orderButton(_ sender: Any) {
    }
    @IBOutlet weak var orderButton: UIButton!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var tableBorderLineView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        priceTotal()
        reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceTotal()
        
    }
    
    
    private func reloadData() {
    shoppingBag = RealmWorkShoppingBag.shared.getItems()
    tableView.reloadData()
    }

    // MARK: - Table view data source
    
    func priceTotal() {
        let bag = RealmWorkShoppingBag.shared.getItems()
        var sum = 0
        for items in bag{
            sum += Int(items.price) ?? 0
        }
        totalPriceLabel.text = "\(sum) ₽"
    }
    
    func createEmptyLabel() {
        let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        emptyLabel.textColor = .red
        emptyLabel.text = "В корзине нет товаров"
        emptyLabel.textAlignment = NSTextAlignment.center
        self.tableView.backgroundView = emptyLabel
//        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        if shoppingBag.count == 0 {
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            emptyLabel.isHidden = false
            orderButton.isEnabled = false
        } else {
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            emptyLabel.isHidden = true
            orderButton.isEnabled = true
        }
    }

}


extension ShoppingBagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        createEmptyLabel()
        return shoppingBag.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShoppingBagTableViewCell
        
        let product = shoppingBag[indexPath.row]
        
        cell.productNameLabel.text =  product.name
        cell.productImageView.downloaded(from: product.image)
        cell.sizeLabel.text = product.size
        cell.priceLabel.text = product.price

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            RealmWorkShoppingBag.shared.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
//            self.reloadData()
            priceTotal()
            if shoppingBag.count == 0{
                tabBarController?.tabBar.items![1].badgeValue = nil
            } else {
                tabBarController?.tabBar.items![1].badgeValue = "\(shoppingBag.count)"
            }
        }
    }
    
    
}
