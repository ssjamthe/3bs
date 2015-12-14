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
    var firstTimeOpen = true
    
    
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var pieChartView: UIView!
    @IBOutlet weak var barChartView: UIView!
    
    func httpGet(request: NSURLRequest!, callback: (String, String?) -> Void) {
        print("Inside http get")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            if error != nil {
                callback("", error!.localizedDescription)
            } else {
                let result = NSString(data: data!, encoding:
                    NSASCIIStringEncoding)!
                callback(result as String, nil)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstTimeOpen)
        {
            firstTimeOpen = false
            let request = NSMutableURLRequest(URL: NSURL(string: Constants.allBanksUrl)!)
            httpGet(request){
                (data, error) -> Void in
                if error != nil {
                    print(error)
                } else {
                    print(data)
                }
            }
            
            //XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
        }
        
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
            tableView.hidden = true
            
        case .BAR_CHART:
            pieChartView.hidden = true
            barChartView.hidden = false
            tableView.hidden = true
        case .TABULAR:
            pieChartView.hidden = true
            barChartView.hidden = true
            tableView.hidden = false
            
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
            let svc = segue.destinationViewController as! PieChartViewController;
            svc.menuData = menuData
            
        }else if(segue.identifier == "barChartSegue")
        {
            let svc = segue.destinationViewController as! BarChartViewController;
            svc.menuData = menuData
            
        }else if(segue.identifier == "tableSegue")
        {
            let svc = segue.destinationViewController as! TableViewController;
            svc.menuData = menuData
            
        }
        
    }
    
    
}

