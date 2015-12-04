//
//  ViewController.swift
//  Finfo
//
//  Created by Swapnil Jamthe on 21/08/15.
//  Copyright (c) 2015 threebs. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    var menuData = MenuData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let banks=["SBI","ICICI","HDFC","HSBC"]
        let complaints=[10.0,5.0,15.0,20.0]
        
        setPieChart(banks,values:complaints)
        
        
        print("Inside ViewController.viewDidLoad " )
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Inside ViewController.viewDidAppear ")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
            let svc = segue.destinationViewController as! MenuUIViewController;
            svc.menuData = menuData
        
    }
    
    func setPieChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Complaints")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        pieChart.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
      
        
    }


}

