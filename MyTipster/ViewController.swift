//
//  ViewController.swift
//  MyTipster
//
//  Created by Vicki Chun on 8/1/15.
//  Copyright (c) 2015 Vicki Grospe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        billField.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func onEditingAmount(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.25]
        var selectedTipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount: Double = NSString(string: billField.text).doubleValue
        
        var tip = billAmount * selectedTipPercentage
        var total = billAmount + tip
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        
        //TODO: create fn for getting saved index
        var defaults = NSUserDefaults.standardUserDefaults()
        var savedTipControlIndex = defaults.integerForKey("defaultTipControlIndex")
        tipControl.selectedSegmentIndex = savedTipControlIndex
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
}

