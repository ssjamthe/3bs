//
//  MenuData.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 02/10/15.
//  Copyright © 2015 threebs. All rights reserved.
//

import Foundation

class MenuData
{
    let banksComparisonMenuData = BanksComparisonMenuData()
    let banksMenuData = BanksMenuData()
    let productsMenuData = ProductsMenuData()
    
    
    var bankNames:[String] = ["ICICI","AXIS","CITI","SBI","ABN Amro","Punjab Bank","Bank Of Maharashtra"]
    var productSubproductsMap: [String:Set<String>] = ["Credit Card":["Gold","Platinum","Silver"],"Personal Loan":["Big Loan","Small Loan","Long Term Loan","Short Term Loan"],"Home Loan":["Home Loan 1","Home Loan 2","Home Loan 3"],"Insurance":["Insurance One","Insurance 2","Insurance 3"]]
    
    var selectedProduct:String = "Credit Card"
    var selectedBanks:Set<String> = Set<String>()
    var selectedSubProducts:Set<String> = Set<String>()
}
