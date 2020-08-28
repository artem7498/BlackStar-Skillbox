//
//  PageSizePickerTextField.swift
//  BlackStar Skillbox
//
//  Created by Артём on 8/21/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import UIKit

typealias PageSizePickerTextFieldDisplayNameHandler = ((Any) -> String)
typealias PageSizePickerTextFieldItemSelectionHandler = ((Int, Any) -> Void)

final class PageSizePickerTextField: UITextField {

    private let pickerView = UIPickerView(frame: .zero)
    private var lastSelectedRow: Int?
    
    public var pickerDatas: [Any] = []
    public var displayNameHandler: PageSizePickerTextFieldDisplayNameHandler?
    public var itemSelectionHandler: PageSizePickerTextFieldItemSelectionHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    private func configureView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.inputView = self.pickerView
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Выбрать", style: .plain, target: self, action: #selector(self.doneButtonTapped))
        toolbar.setItems([spaceButton, doneButton], animated: false)
        
        self.inputAccessoryView = toolbar
    }
    
    private func updateText() {
        if self.lastSelectedRow == nil {
            self.lastSelectedRow = 0
        }
        if self.lastSelectedRow! > self.pickerDatas.count {
            return
        }
        let data = self.pickerDatas[self.lastSelectedRow!]
        self.text = self.displayNameHandler?(data)
        
    }
    
    @objc func doneButtonTapped() {
        self.updateText()
        self.resignFirstResponder()
    }
    
    
    
    
}

extension PageSizePickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = self.pickerDatas[row]
        return self.displayNameHandler?(data)
    }
}

extension PageSizePickerTextField: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDatas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.lastSelectedRow = row
        self.updateText()
        let data = self.pickerDatas[row]
        self.itemSelectionHandler?(row, data)
    }
   
    
    
    
    
    
}
    
    

