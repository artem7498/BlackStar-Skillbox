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
    
    
    @IBAction func buyButtonn(_ sender: Any) {
        
        let chooseSizeAlert = UIAlertController(title: "Размер не выбран", message: "Пожалуйста выберите размер, чтобы добавить товар в корзину", preferredStyle: UIAlertController.Style.alert)
        chooseSizeAlert.addAction(UIAlertAction(title: "ОК", style: UIAlertAction.Style.default, handler: nil))
        
        let addedToBagAlert = UIAlertController(title: "Товар успешно добавлен в корзину", message: "Хотите посмотреть корзину?", preferredStyle: UIAlertController.Style.alert)
        addedToBagAlert.addAction(UIAlertAction(title: "Да, перейти в корзину", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.performSegue(withIdentifier: "Show Shopping Bag", sender: nil)
        }))
        addedToBagAlert.addAction(UIAlertAction(title: "Продолжить покупки", style: UIAlertAction.Style.cancel, handler: nil))
        
        
        if sizePickerTextField.text != "" {
            
            RealmWorkShoppingBag.shared.save(name: productNameLabel.text ?? "no name", price: priceLabel.text ?? "no price", article: articleLabel.text ?? "no article", size: sizePickerTextField.text!)
            self.present(addedToBagAlert, animated: true, completion: nil)
        } else {
            self.present(chooseSizeAlert, animated: true, completion: nil)
        }
    }
    
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
        productPageImageView.image = #imageLiteral(resourceName: "Спортивный костюм")
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
