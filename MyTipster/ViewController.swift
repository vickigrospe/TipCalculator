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
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
        super.viewWillAppear(animated)
        self.showInitialView()
    }
    
/* 
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
        super.viewDidAppear(animated);
    }

    override func viewDidDisappear(animated: Bool) {
        print("viewDidDisappear")
        super.viewDidDisappear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear")
        super.viewWillDisappear(animated)
    }
*/
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   
    @IBAction func onEditingAmount(sender: AnyObject) {
        self.updateValues()
    }
    
    func showInitialView() {
        // Get saved tip control index
        let savedTipControlIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipControlIndex")
        tipControl.selectedSegmentIndex = savedTipControlIndex
        
        // update tip and total values
        self.updateValues()
        self.billField.becomeFirstResponder()
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
            self.hideElements(true)
        } else {
            let billAmount: Double = NSString(string: billField.text!).doubleValue
            let tip = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
            let total = billAmount + tip
            
            tipValue.text = "$\(tip)"
            totalValue.text = "$\(total)"
            tipValue.text = String(format: "$%.2f", tip)
            totalValue.text = String(format: "$%.2f", total)
            
            self.hideElements(false)
        }
    }
}

