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
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Retrieve the default tip percentage
        var savedTipControlIndex = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipControlIndex")
        defaultTipControl.selectedSegmentIndex = savedTipControlIndex
    }
    
    @IBAction func onBackCicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipControlIndex")
        defaults.synchronize()
    }

}
