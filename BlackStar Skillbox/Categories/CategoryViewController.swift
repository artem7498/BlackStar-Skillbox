//
//  ViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/10/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var categories: [Category] = []
    var subcategoryArray: [Subcategory] = []

   
    @IBOutlet weak var tableView: UITableView!
    
     @IBOutlet weak var backToCategoryButton: UIBarButtonItem!
    
    @IBAction func backToCategoryButton(_ sender: Any) {
        categories.removeAll()
        subcategoryArray.removeAll()
        navigationItem.leftBarButtonItem?.isEnabled = false
        loadCategories { categories in
            self.categories = categories
            self.tableView.reloadData()
//            print(categories)
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        navigationItem.leftBarButtonItem?.isEnabled = false
        // Do any additional setup after loading the view.
        loadCategories { categories in
            self.categories = categories
            self.tableView.reloadData()
//            print(categories)
        }
    }
    private func setupSearchBar(){
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProductsViewController, segue.identifier == "Show Products", let id = sender as? String {
            vc.id = id
            print(vc.id)
        }
    }

}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if subcategoryArray.isEmpty {
            return categories.count
        } else {
            return subcategoryArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CategoryTableViewCell
        
        if subcategoryArray.isEmpty {
            let category = categories[indexPath.row]
            cell.category = category
//            cell.showProductsButton.isHidden = true
        } else {
            let subCategory = subcategoryArray[indexPath.row]
            cell.subCategory = subCategory
            navigationItem.leftBarButtonItem?.isEnabled = true
//            cell.showProductsButton.isHidden = false
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !subcategoryArray.isEmpty {
            performSegue(withIdentifier: "Show Products", sender: subcategoryArray[indexPath.row].id)
//            print(subcategoryArray[indexPath.row].id)
            return
        }
        
        subcategoryArray = categories[indexPath.row].subcategories ?? []
        tableView.reloadData()
    }
    
}

extension CategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
