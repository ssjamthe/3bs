//
//  MenuUIViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 25/08/15.
//  Copyright (c) 2015 threebs. All rights reserved.
//

import UIKit

class MenuUIViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var dataTypePicker: UIPickerView!
    
    @IBOutlet weak var dataReprsentationPicker: UIPickerView!
    
    let dataTypePickerOptions=[["Compare Banks","Banks","Products"]]
    
    let dataRepresentationPickerOptions=[["Pie Chart","Line Chart","Tabular Data","Row Data"]]
    
    var menuData : MenuData!
    
    
    @IBOutlet weak var banksComparisonMenu: UIView!
    
    @IBOutlet weak var banksMenu: UIView!
    
    @IBOutlet weak var productsMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTypePicker.delegate = self
        dataTypePicker.dataSource = self
        dataReprsentationPicker.delegate = self
        dataReprsentationPicker.dataSource = self
        showBanksComparisonMenu()
        
        print("Inside MenuUIViewController.viewDidLoad ")
        
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("Inside MenuUIViewController.viewDidDisappear ")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == dataTypePicker
        {
            return dataTypePickerOptions.count
        }
        else
        {
            return dataRepresentationPickerOptions.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dataTypePicker
        {
            return dataTypePickerOptions[component].count
        }
        else
        {
            return dataRepresentationPickerOptions[component].count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dataTypePicker
        {
            return dataTypePickerOptions[component][row]
        }
        else
        {
            return dataRepresentationPickerOptions[component][row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dataTypePicker
        {
            
            if row == 0
            {
                showBanksComparisonMenu()            }
            else if row == 1
            {
                showBanksMenu()
            }
            else
            {
                showProductsMenu()
            }
        }
    }
    
    func showBanksComparisonMenu()
    {
        banksComparisonMenu.hidden=false
        banksMenu.hidden=true
        productsMenu.hidden=true
    }
    
    func showBanksMenu()
    {
        banksComparisonMenu.hidden=true
        banksMenu.hidden=false
        productsMenu.hidden=true
    }
    
    func showProductsMenu()
    {
        banksComparisonMenu.hidden=true
        banksMenu.hidden=true
        productsMenu.hidden=false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "banksComparisonMenuSegue") {
            print("Inside MenuUIViewController if banksComparisonMenuSegue")
            let svc = segue.destinationViewController as! BanksComparisonMenuViewController;
            svc.menuData = menuData
            
        }else if (segue.identifier == "productsMenuSegue") {
            print("Inside MenuUIViewController if productsMenuSegue")
            let svc = segue.destinationViewController as! ProductsMenuViewController;
            svc.menuData = menuData
            
        }else if (segue.identifier == "banksMenuSegue") {
            print("Inside MenuUIViewController if banksMenuSegue")
            let svc = segue.destinationViewController as! BanksMenuViewController;
            svc.menuData = menuData
            
        }
        else if(segue.identifier == "mainPageSegue") {
            let svc = segue.destinationViewController as! ViewController;
            svc.menuData = menuData
            
        }
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
