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
        
//        let urlString = "https://blackstarshop.ru/index.php?route=api/v1/categories"
//        guard let url = URL(string: urlString) else {return}
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            DispatchQueue.main.async {
//                 if let error = error {
//                    print("Some error", error)
//                    return
//                }
//                guard let data = data else {return}
//
//                do {
//                    let websiteDescription = try JSONDecoder().decode(Categories.self, from: data)
//                    print(websiteDescription.name ?? "no data")
//                } catch let jsonError {
//                    print(jsonError)
//                    return
//                }
//            }
//        }.resume()
        
        
        
        
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
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
