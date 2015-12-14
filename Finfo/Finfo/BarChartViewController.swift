//
//  BarChartViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 06/12/15.
//  Copyright © 2015 threebs. All rights reserved.
//

import Foundation
import UIKit
import Charts

class BarChartViewController : UIViewController
{
    
    @IBOutlet weak var header: UILabel!
    var menuData : MenuData!
    @IBOutlet weak var barChart: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let banks : [String]!
        let data : [Double]!
        let dataLabel : String!
        
        
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
        
        setBarChart(banks,values:data,dataLabel:dataLabel)

        
        print("Inside BarChartViewController.viewDidLoad " )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBarChart(dataPoints: [String], values: [Double],dataLabel:String) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: dataLabel)
        let barChartData = BarChartData(xVals: dataPoints, dataSet: barChartDataSet)
        barChart.data = barChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        barChartDataSet.colors = colors

        
    }
}
