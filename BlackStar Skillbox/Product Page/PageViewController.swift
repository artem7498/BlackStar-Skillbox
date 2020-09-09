//
//  PageViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/20/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    let shopBag = RealmWorkShoppingBag.shared.getItems()
    
    var productInfo: Products?
    var sizes: [String] = []
    var images: [String] = []
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet private weak var sizePickerTextField: PageSizePickerTextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    let bagImage = "https://blackstarshop.ru/"
    
    @IBAction func buyButtonn(_ sender: Any) {
        
        let chooseSizeAlert = UIAlertController(title: "Размер не выбран", message: "Пожалуйста выберите размер, чтобы добавить товар в корзину", preferredStyle: UIAlertController.Style.alert)
        chooseSizeAlert.addAction(UIAlertAction(title: "ОК", style: UIAlertAction.Style.default, handler: nil))
        
        let addedToBagAlert = UIAlertController(title: "Товар успешно добавлен в корзину", message: "\(productNameLabel.text!) \nразмер: \(sizePickerTextField.text!)", preferredStyle: UIAlertController.Style.alert)
        
        addedToBagAlert.addAction(UIAlertAction(title: "Продолжить покупки", style: UIAlertAction.Style.default, handler: nil))
        
        
        
        if sizePickerTextField.text != "" {
            
            RealmWorkShoppingBag.shared.save(name: productNameLabel.text ?? "no name", price: priceLabel.text ?? "no price", article: articleLabel.text ?? "no article", size: sizePickerTextField.text!, image: (bagImage + (productInfo?.mainImage)!))
            tabBarController?.tabBar.items![1].badgeValue = "\(shopBag.count)"
            self.present(addedToBagAlert, animated: true, completion: nil)
        } else {
            self.present(chooseSizeAlert, animated: true, completion: nil)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        imagePageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productSizesLoader()
        productImagesLoader()
        
        self.sizePickerTextField.displayNameHandler = { item in
            return (item as? String) ?? "" }
        self.sizePickerTextField.itemSelectionHandler = { index, item in
            print("\(index), \(item as? String)") }
        
        self.imagePageControl.numberOfPages = images.count
        self.imagePageControl.currentPage = 0
        
        
        print(productInfo)
        
        navigationItem.title = productInfo?.name
        priceLabel.text = "\(Int(((productInfo?.price ?? "0") as NSString).floatValue))"
        productNameLabel.text = productInfo?.name
        articleLabel.text = "\(productInfo?.article ?? "No Article")"
        colorLabel.text = "\(productInfo?.colorName ?? "No Color")"
        productDescriptionLabel.text = productInfo?.description
//        productPageImageView.image = #imageLiteral(resourceName: "Спортивный костюм")
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
    
    func productImagesLoader() {
        if let images = productInfo?.productImages {
            for item in images {
                if let str = item.imageURL {
                    self.images.append(str)
                    print(images)
                }
            }
        }
    }
    

}


extension PageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PageCollectionViewCell
        
        cell.productImageView.downloaded(from: "https://blackstarshop.ru/" + images[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width / 3 * 4)
    }
}
