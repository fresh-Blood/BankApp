//
//  Выпадающий список.swift
//  Bank
//
//  Created by Admin on 26.10.2021.
//

import Foundation
import UIKit

extension InfoViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.share.list.count
    }
    
    
}
