//
//  DataTypePickerHandler.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 07/09/15.
//  Copyright (c) 2015 threebs. All rights reserved.
//

import Foundation
import UIKit
class DataTypePickerHandler:UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    
    let dataTypePickerOptions=[["Banks Comparison","Banks","Products"]]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return dataTypePickerOptions.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataTypePickerOptions[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return dataTypePickerOptions[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    
    
}