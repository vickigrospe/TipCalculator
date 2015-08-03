//
//  SettingsViewController.swift
//  MyTipster
//
//  Created by Vicki Chun on 8/2/15.
//  Copyright (c) 2015 Vicki Grospe. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var tipPercentages = ["18", "20", "25"]  //TODO is this right?
        var defaults = NSUserDefaults.standardUserDefaults()
        var savedTip = defaults.valueForKey("defaultTipSelected")
        var savedTipControlIndex = defaults.integerForKey("defaultTipControlIndex")
        
        defaultTipControl.selectedSegmentIndex = savedTipControlIndex
  
        println("saved tips is \(savedTip)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        println("default tip changed")
        
        var tipPercentages = ["18", "20", "25"]
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(tipPercentages[defaultTipControl.selectedSegmentIndex], forKey: "defaultTipSelected")
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipControlIndex")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("settings view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("settings view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("settings view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("settings view did disappear")
    }

}
