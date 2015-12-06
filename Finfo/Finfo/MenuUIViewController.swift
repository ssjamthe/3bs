//
//  MenuUIViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 25/08/15.
//  Copyright (c) 2015 threebs. All rights reserved.
//

import UIKit

class MenuUIViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var productTextInput: UITextField!
    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var dataTypePicker: UIPickerView!
    @IBOutlet weak var dataReprsentationPicker: UIPickerView!
    
    var productTextInputClicked = false
    var bankPlusClicked = false
    var subproductPlusClicked = false
    
    let dataRepresentationPickerOptions=[["Pie Chart","Bar Chart","Tabular Data","Raw Data"]]
    let dataRepresentationOptions = [[DataRepresentation.PIE_CHART,DataRepresentation.BAR_CHART,DataRepresentation.TABULAR,DataRepresentation.RAW_DATA]]
    
    
    let dataTypePickerOptions=[["Complaints","Timely Response Percent","Disputed Response Percent"]]
    let dataTypeOptions = [[DataType.COMPLAINTS,DataType.TIMELY_RESPONSE_PERCENT,DataType.DISPUTED_RESPONSE_PERCENT]]
    
    var menuData : MenuData!
    
    
    @IBOutlet weak var banksComparisonMenu: UIView!
    
    @IBOutlet weak var banksMenu: UIView!
    
    @IBOutlet weak var productsMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.menuList.delegate = self
        self.menuList.dataSource = self
        self.menuList.hidden = true
        
        self.dataReprsentationPicker.delegate = self
        self.dataReprsentationPicker.dataSource = self
        
        self.dataTypePicker.delegate = self
        self.dataTypePicker.dataSource = self
        
        self.productTextInput.delegate = self
        
        self.productTextInput.text = self.menuData.selectedProduct
        
        print("Inside MenuUIViewController.viewDidLoad ")
        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if bankPlusClicked
        {
            return self.menuData.bankNames.count
        }else if productTextInputClicked
        {
            return Array(self.menuData.productSubproductsMap.keys).count
        }
        else if subproductPlusClicked
        {
            return self.menuData.productSubproductsMap[self.menuData.selectedProduct]!.count
        }
        else
        {
            return 0
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.menuList.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        if bankPlusClicked
        {
            cell.textLabel?.text = self.menuData.bankNames[indexPath.row]
            if self.menuData.selectedBanks.contains(self.menuData.bankNames[indexPath.row])
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
            }
        }
        else if productTextInputClicked
        {
            cell.textLabel?.text = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            if self.menuData.selectedProduct == Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
                
            }
            
        }else if subproductPlusClicked
        {
            let subProductName = Array(self.menuData.productSubproductsMap[self.menuData.selectedProduct]!)[indexPath.row]
            cell.textLabel?.text = subProductName
            if self.menuData.selectedSubProducts.contains(subProductName)
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
                
            }
        }
        
        print(cell.textLabel?.text)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
        
        if bankPlusClicked
        {
            
            self.menuData.selectedBanks.insert(self.menuData.bankNames[indexPath.row])
            
            
        }else if productTextInputClicked
        {
            let product = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            
            self.menuData.selectedProduct = product
            self.productTextInput.text = product
            self.menuList.hidden = true
            
        }else if subproductPlusClicked
        {
            let subproduct = Array(self.menuData.productSubproductsMap[self.menuData.selectedProduct]!)[indexPath.row]
            print("selected subproduct " + subproduct)
            
            self.menuData.selectedSubProducts.insert(subproduct)
            
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if bankPlusClicked
        {
            self.menuData.selectedBanks.remove(self.menuData.bankNames[indexPath.row])
            
        }else if productTextInputClicked
        {
            self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
            self.menuList.hidden = true
        }else if subproductPlusClicked
        {
            let subproduct = Array(self.menuData.productSubproductsMap[self.menuData.selectedProduct]!)[indexPath.row]
            self.menuData.banksComparisonMenuData.selectedSubProducts.remove(subproduct)
        }
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
        
        if(pickerView == dataTypePicker)
        {
            return dataTypePickerOptions.count
        }
        else
        {
            return dataRepresentationPickerOptions.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print("compnent")
        print(component)
        
        if(pickerView == dataTypePicker)
        {
            
            return dataTypePickerOptions[component].count
        }
        else
        {
            return dataRepresentationPickerOptions[component].count
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        print("compnent")
        print(component)
        if(pickerView == dataTypePicker)
        {
            if(dataTypeOptions[component][row] == self.menuData.selectedDataType)
            {
                pickerView.selectRow(row,inComponent: component,animated: false)
            }
            
            return dataTypePickerOptions[component][row]
            
        }
        else
        {
            if(dataRepresentationOptions[component][row] == self.menuData.selectedRepresentation)
            {
                pickerView.selectRow(row,inComponent: component,animated: false)
            }
            
            return dataRepresentationPickerOptions[component][row]
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == dataTypePicker)
        {
            self.menuData.selectedDataType = dataTypeOptions[component][row]
        }
        else
        {
            self.menuData.selectedRepresentation = dataRepresentationOptions[component][row]
            
        }
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "mainPageSegue") {
            let svc = segue.destinationViewController as! ViewController;
            svc.menuData = menuData
            
        }
    }
    
    
    @IBAction func banksPlusAction(sender: AnyObject) {
        
        if bankPlusClicked
        {
            self.menuList.hidden = true
            bankPlusClicked = false
        }
        else
        {
            bankPlusClicked = true
            productTextInputClicked = false
            subproductPlusClicked = false
            self.menuList.reloadData()
            self.menuList.hidden = false
        }
    }
    
    @IBAction func touchDownProductTextAction(sender: UITextField) {
        
        print("Inside touchDownBankTextAction")
        productTextInputClicked = true
        
        bankPlusClicked = false
        subproductPlusClicked = false
        
        self.menuList.reloadData()
        self.menuList.hidden = false
        
        
    }
    
    
    @IBAction func subProductPlusAction(sender: AnyObject) {
        
        if subproductPlusClicked
        {
            self.menuList.hidden = true
            subproductPlusClicked = false
        }
        else
        {
            bankPlusClicked = false
            productTextInputClicked = false
            subproductPlusClicked = true
            self.menuList.reloadData()
            self.menuList.hidden = false
        }
    }
    
}
