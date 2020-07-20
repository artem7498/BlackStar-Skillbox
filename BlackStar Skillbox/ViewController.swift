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

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CategoryTableViewCell
        cell.categoryNameLabel.text = categories[indexPath.row].name
        cell.categoryImage.image = UIImage(named: categories[indexPath.row].image ?? "Сотовая связь")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell){
            
            let destVC = segue.destination as! SubcategoryTableViewController
            
            
//            как здесь правильно передать подкатегории, пробовал достать tempArray, но чего то не получается

//            var passingArray : [Category]
//            passingArray = [categories[index.row]]
//            destVC.subcategories = passingArray

            print("pressed on \(categories[index.row])")
    
        }
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
