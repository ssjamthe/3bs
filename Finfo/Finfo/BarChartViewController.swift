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
    
    @IBOutlet weak var barChart: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let banks=["SBI","ICICI","HDFC","HSBC"]
        let complaints=[10.0,5.0,15.0,20.0]
        
        setBarChart(banks,values:complaints)
        
        print("Inside BarChartViewController.viewDidLoad " )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBarChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: "Complaints")
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
