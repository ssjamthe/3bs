//
//  BanksMenuViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 13/10/15.
//  Copyright © 2015 threebs. All rights reserved.
//

import UIKit

class BanksMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet weak var menuList: UITableView!
    
    @IBOutlet weak var bankTextInput: UITextField!
    
    var bankTextInputClicked = false
    var productPlusClicked = false
    var subproductPlusClicked = false

    
    var menuData : MenuData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.menuList.delegate = self
        self.menuList.dataSource = self
        
        self.menuList.hidden = true
        
        self.bankTextInput.delegate = self
    }
    
    @IBAction func touchDownBankTextAction(sender: UITextField) {
        
        print("Inside touchDownBankTextAction")
        bankTextInputClicked = true
        
        self.menuList.reloadData()
        self.menuList.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if bankTextInputClicked
        {
            return self.menuData.bankNames.count
        }else if productPlusClicked
        {
            return Array(self.menuData.productSubproductsMap.keys).count
        }
        else if subproductPlusClicked
        {
            var count = 0
            for product in self.menuData.banksMenuData.selectedProducts
            {
                count = count + self.menuData.productSubproductsMap[product]!.count
            }
            
            return count
        }
        else
        {
            return 0
        }
    }
    
    func getSubproductAtIndex(row : Int) -> String{
        
        var count = 0
        for product in self.menuData.banksMenuData.selectedProducts
        {
            let currSize = self.menuData.productSubproductsMap[product]!.count
            if row < (count + currSize)
            {
                let ind=row - count
                return Array(self.menuData.productSubproductsMap[product]!)[ind]
                
            }
            
            count = count + currSize
        }
        
        return ""
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.menuList.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        if bankTextInputClicked
        {
            cell.textLabel?.text = self.menuData.bankNames[indexPath.row]
            if self.menuData.banksMenuData.selectedBank == self.menuData.bankNames[indexPath.row]
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
            }
        }
        else if productPlusClicked
        {
            cell.textLabel?.text = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            if self.menuData.banksMenuData.selectedProducts.contains(Array(self.menuData.productSubproductsMap.keys)[indexPath.row])
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
                
            }
            
        }else if subproductPlusClicked
        {
            let subProductName = getSubproductAtIndex(indexPath.row)
            cell.textLabel?.text = subProductName
            if self.menuData.banksMenuData.selectedSubProducts.contains(subProductName)
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
        
        if bankTextInputClicked
        {
            self.menuData.banksMenuData.selectedBank = self.menuData.bankNames[indexPath.row]
            self.bankTextInput.text = self.menuData.bankNames[indexPath.row]
            self.menuList.hidden = true
            
        }else if productPlusClicked
        {
            let product = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            
            self.menuData.banksMenuData.selectedProducts.insert(product)
            
        }else if subproductPlusClicked
        {
            let subproduct = getSubproductAtIndex(indexPath.row)
            
            self.menuData.banksMenuData.selectedSubProducts.insert(subproduct)
            
        }
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if bankTextInputClicked
        {
            self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
            self.menuList.hidden = true
        }else if productPlusClicked
        {
            let product = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            self.menuData.banksComparisonMenuData.selectedProducts.remove(product)
        }else if subproductPlusClicked
        {
            let subproduct = getSubproductAtIndex(indexPath.row)
            self.menuData.banksComparisonMenuData.selectedSubProducts.remove(subproduct)
        }
    }
    
    
    
    @IBAction func plusProductAction(sender: AnyObject) {
        
    }
    
    
    @IBAction func plusSubproductAction(sender: AnyObject) {
    }
}
