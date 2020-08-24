//
//  PageViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/20/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var productInfo: Products?
    var sizes: [String] = []
    
    @IBOutlet weak var productPageImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet private weak var sizePickerTextField: PageSizePickerTextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productSizesLoader()
        
        self.sizePickerTextField.displayNameHandler = { item in
            return (item as? String) ?? "" }
        self.sizePickerTextField.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)") }
        
        print(productInfo)
        
        navigationItem.title = productInfo?.name
        priceLabel.text = productInfo?.price
        productNameLabel.text = productInfo?.name
        articleLabel.text = "Артикул: \(productInfo?.article ?? "No Article")"
        colorLabel.text = "Цвет: \(productInfo?.colorName ?? "No Color")"
        productDescriptionLabel.text = productInfo?.description
    }
    
    
    func productSizesLoader() {
        if let sizes = productInfo?.sizes {
            for item in sizes {
                if let str = item.size {
                    self.sizePickerTextField.pickerDatas.append(str)
                }
            }
        }
    }
    

}
