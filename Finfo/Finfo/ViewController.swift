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
    
    var menuData = MenuData()
    
    
    @IBOutlet weak var pieChartView: UIView!
    @IBOutlet weak var barChartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSelectedView()
        
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
    
    func showSelectedView()
    {
        switch menuData.selectedRepresentation
        {
        case .PIE_CHART:
            pieChartView.hidden = false
            barChartView.hidden = true
            
        case .BAR_CHART:
            pieChartView.hidden = true
            barChartView.hidden = false
        default:
            print("default case should not happen")
            
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "menuSegue") {
            let svc = segue.destinationViewController as! MenuUIViewController;
            svc.menuData = menuData
        }
        else if(segue.identifier == "pieChartSegue")
        {
            
        }
        
    }
    
    
}

