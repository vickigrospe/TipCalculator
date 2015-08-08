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
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        if billField.text == "" {
            self.hideElements(true)
        }
        else
        {
            var billAmount: Double = NSString(string: billField.text).doubleValue
            var tip = billAmount * selectedTipPercentage
            var total = billAmount + tip
            
            tipValue.text = "$\(tip)"
            totalValue.text = "$\(total)"
            tipValue.text = String(format: "$%.2f", tip)
            totalValue.text = String(format: "$%.2f", total)
            
            self.hideElements(false)
        }
        
    }
    
    func hideElements(hide: Bool) {
        tipValue.hidden = hide
        tipLabel.hidden = hide
        totalValue.hidden = hide
        totalLabel.hidden = hide
        tipControl.hidden = hide
    }
    
    func updateValues() {
        if (billField.text != "'") {
            var billAmount: Double = NSString(string: billField.text).doubleValue
            var tipPercentages = [0.18,0.2,0.25]
            var tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
            var total = billAmount + tip
            
            tipValue.text = "$\(tip)"
            totalValue.text = "$\(total)"
            tipValue.text = String(format: "$%.2f", tip)
            totalValue.text = String(format: "$%.2f", total)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        
        // Get saved tip control index
        var defaults = NSUserDefaults.standardUserDefaults()
        var savedTipControlIndex = defaults.integerForKey("defaultTipControlIndex")
        tipControl.selectedSegmentIndex = savedTipControlIndex
        
        // update tip and total values if necessary
        self.updateValues()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

