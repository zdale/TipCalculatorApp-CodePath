//
//  ViewController.swift
//  Tippy, the Tip Calculator App
//
//  Created by Zach Dale on 12/30/15.
//  Copyright © 2015 Zach Dale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialized the labels below
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        perPersonLabel.text = "$0.00"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        //takes the value chosen for percent segmented control and puts it into percent variable
        var tipPercentages = [0.15, 0.20, 0.25, 0.30]
        var percent = tipPercentages[tipControl.selectedSegmentIndex]
        
        //takes the value chosen for number of people segmented control and puts it into people variable
        var numPeople = [1.0, 2.0, 3.0, 4.0, 5.0]
        var people = numPeople[peopleControl.selectedSegmentIndex]
        
        //takes the input from the billField and mutates it to set the tip, total, and perPersonTotal values
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * percent
        var total = billAmount + tip
        var perPersonTotal = (total/people)

        //puts the calculated values into the labels
        tipLabel.text = String(format: "$%.2f", tip)
        perPersonLabel.text = String(format: "$%.2f", perPersonTotal)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

