//
//  ViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 7/10/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var categories: [Category] = []
    var subcategoryArray: [Subcategory] = []

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        // Do any additional setup after loading the view.
        loadCategories { categories in
            self.categories = categories
            self.tableView.reloadData()
            print(categories)
        }
    }
    private func setupSearchBar(){
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell){

            print("pressed on \(categories[index.row])")
    
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
        } else {
            let subCategory = subcategoryArray[indexPath.row]
            cell.subCategory = subCategory
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        subcategoryArray = categories[indexPath.row].subcategories ?? []
        tableView.reloadData()
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
