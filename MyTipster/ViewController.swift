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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated) //?ß
            
        // Get saved tip control index
        var savedTipControlIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipControlIndex")
        tipControl.selectedSegmentIndex = savedTipControlIndex
        
        // update tip and total values if necessary
        self.updateValues()
        
        self.billField.becomeFirstResponder()
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func onEditingAmount(sender: AnyObject) {
        self.updateValues()
    }
    
    func hideElements(hide: Bool) {
        tipValue.hidden = hide
        tipLabel.hidden = hide
        totalValue.hidden = hide
        totalLabel.hidden = hide
        tipControl.hidden = hide
    }
    
    func updateValues() {
        let tipPercentages = [0.18,0.2,0.22]
    
        if (billField.text == "") {
            //TODO: show initial view, animated (if we are clearing the bill amt)
            self.hideElements(true)
        } else {
            //TODO: show the results view animated
            var billAmount: Double = NSString(string: billField.text).doubleValue
            var tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
            var total = billAmount + tip
            
            tipValue.text = "$\(tip)"
            totalValue.text = "$\(total)"
            tipValue.text = String(format: "$%.2f", tip)
            totalValue.text = String(format: "$%.2f", total)
            
            self.hideElements(false)
        }
    }
}

