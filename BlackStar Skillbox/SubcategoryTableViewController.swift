//
//  SubcategoryTableViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/16/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class SubcategoryTableViewController: UITableViewController {
    
    var subcategories: [Subcategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubcategoryTableViewCell
        cell.subcategoryNameLabel.text = "hi"
        cell.subcategoryImage.image = UIImage(named: "Сотовая связь")

        return cell
    }

}
