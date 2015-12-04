//
//  BanksComparisonMenuViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 02/10/15.
//  Copyright © 2015 threebs. All rights reserved.
//

import UIKit

class BanksComparisonMenuViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var menuList: UITableView!
    
    
    var bankPlusClicked = false
    var productPlusClicked = false
    var subproductPlusClicked = false
    
    var menuData : MenuData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.menuList.delegate = self
        self.menuList.dataSource = self
        
        self.menuList.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Inside BanksComparisonMenuViewController")
        if bankPlusClicked
        {
            return self.menuData.bankNames.count
        }else if productPlusClicked
        {
            return Array(self.menuData.productSubproductsMap.keys).count
        }
        else if subproductPlusClicked
        {
            var count = 0
            for product in self.menuData.banksComparisonMenuData.selectedProducts
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
        for product in self.menuData.banksComparisonMenuData.selectedProducts
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
        
        if bankPlusClicked
        {
            cell.textLabel?.text = self.menuData.bankNames[indexPath.row]
            if self.menuData.banksComparisonMenuData.selectedBanks.contains(self.menuData.bankNames[indexPath.row])
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)
            }
        }
        else if productPlusClicked
        {
            cell.textLabel?.text = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            if self.menuData.banksComparisonMenuData.selectedProducts.contains(Array(self.menuData.productSubproductsMap.keys)[indexPath.row])
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)

            }
            
        }else if subproductPlusClicked
        {
            let subProductName = getSubproductAtIndex(indexPath.row)
            cell.textLabel?.text = subProductName
            if self.menuData.banksComparisonMenuData.selectedSubProducts.contains(subProductName)
            {
                cell.selected = true
                self.menuList.selectRowAtIndexPath(indexPath, animated:false,scrollPosition:UITableViewScrollPosition.None)

            }
        }
        
        print(cell.textLabel?.text)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if bankPlusClicked
        {
            self.menuData.banksComparisonMenuData.selectedBanks.remove(self.menuData.bankNames[indexPath.row])
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
        
        if bankPlusClicked
        {
            
                self.menuData.banksComparisonMenuData.selectedBanks.insert(self.menuData.bankNames[indexPath.row])
            
        }else if productPlusClicked
        {
            let product = Array(self.menuData.productSubproductsMap.keys)[indexPath.row]
            
                self.menuData.banksComparisonMenuData.selectedProducts.insert(product)
            
        }else if subproductPlusClicked
        {
            let subproduct = getSubproductAtIndex(indexPath.row)
            
                self.menuData.banksComparisonMenuData.selectedSubProducts.insert(subproduct)
            
        }
    }
    

    @IBAction func plusBankAction(sender: AnyObject) {
        
        if bankPlusClicked
        {
            self.menuList.hidden = true
            bankPlusClicked = false
        }
        else
        {
            bankPlusClicked = true
            productPlusClicked = false
            subproductPlusClicked = false
            self.menuList.reloadData()
            self.menuList.hidden = false
        }
    }
    
    @IBAction func plusProductAction(sender: AnyObject) {
        
        if productPlusClicked
        {
            self.menuList.hidden = true
            productPlusClicked = false
        }
        else
        {
            bankPlusClicked = false
            productPlusClicked = true
            subproductPlusClicked = false
            self.menuList.reloadData()
            self.menuList.hidden = false
        }
        
    }
    
    
    @IBAction func plusSubproductAction(sender: AnyObject) {
        
        if subproductPlusClicked
        {
            self.menuList.hidden = true
            subproductPlusClicked = false
        }
        else
        {
            bankPlusClicked = false
            productPlusClicked = false
            subproductPlusClicked = true
            self.menuList.reloadData()
            self.menuList.hidden = false
        }
    }
}
