//
//  SubcategoryTableViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/16/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ShopingBagViewController: UIViewController {
    
    var subcategories: [Subcategory] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func orderButton(_ sender: Any) {
    }
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source


}


extension ShopingBagViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShopingBagTableViewCell
        cell.productNameLabel.text =  "no data"
        cell.productImageView.image = UIImage(named: "Сотовая связь")

        return cell
    }
    
}
