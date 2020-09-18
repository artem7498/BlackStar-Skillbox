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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem?.isEnabled = false
        
        loadCategories { categories in
            self.categories = categories
            self.tableView.reloadData()
//            print(self.subcategoryArray)
        }
        
        
        
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
        
//        if indexPath.row%2 == 0 {
//            cell.backgroundColor = UIColor.systemGray6
//        }
        
        if subcategoryArray.isEmpty {
            let category = categories[indexPath.row]
            cell.category = category
        } else {
            let subCategory = subcategoryArray[indexPath.row]
            cell.subCategory = subCategory
            navigationItem.leftBarButtonItem?.isEnabled = true
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !subcategoryArray.isEmpty {
            performSegue(withIdentifier: "Show Products", sender: subcategoryArray[indexPath.row].id)
            return
        }
        
        subcategoryArray = categories[indexPath.row].subcategories ?? []
        tableView.reloadData()
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
