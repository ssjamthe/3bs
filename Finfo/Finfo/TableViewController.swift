//
//  TableViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 07/12/15.
//  Copyright © 2015 threebs. All rights reserved.
//

import Foundation
import UIKit
import Charts

class TableViewController : UIViewController,UITableViewDelegate,UITableViewDataSource
{
 
    @IBOutlet weak var header: UILabel!
    var menuData : MenuData!
    @IBOutlet weak var table: UITableView!
    var banks: [String]!
    var data: [Double]!
    var dataLabel : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.table.delegate = self
        self.table.dataSource = self
        self.table.hidden = false
        
        switch(menuData.selectedDataType)
        {
        case .COMPLAINTS:
            header.text = "Number of Complaints"
            banks = ["HSBC","HDFC","SBI","ABN Amro"]
            data = [50.0,70.0,20.0,10.0]
            dataLabel = "Complaints"
        case .TIMELY_RESPONSE_PERCENT:
            header.text = "Timely Response Percent"
            banks = ["ICICI","HDFC","SBI","ABN Amro"]
            data = [5.0,17.0,40.0,12.0]
            dataLabel = "Timely Response"
        case .DISPUTED_RESPONSE_PERCENT:
            header.text = "Disputed Response Percent"
            banks = ["SBI","HDFC","SBI","ABN Amro"]
            data = [15.0,19.0,10.0,15.0]
            dataLabel = "Timely Response"
        }
        
        print("Inside TableViewController.viewDidLoad " )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return banks.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let cell = self.table.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        let text1 = UILabel(frame: CGRectMake(20, cell.contentView.frame.size.height/2, 200, 100))
       
        text1.text = banks[indexPath.row]
        
        let text2 = UILabel(frame: CGRectMake(210, cell.contentView.frame.size.height/2, 410, 100))
        
        text2.text = String(format:"%.0f",data[indexPath.row])
        
        cell.contentView.addSubview(text1)
        cell.contentView.addSubview(text2)
        
        return cell
    }
    
    
}
