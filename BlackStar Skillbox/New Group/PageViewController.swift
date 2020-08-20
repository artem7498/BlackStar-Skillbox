//
//  PageViewController.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/20/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    var productInfo: [Products] = []
    
    @IBOutlet weak var productPageImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var colorSizePickerView: UIPickerView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(productInfo)
    }
    

}
