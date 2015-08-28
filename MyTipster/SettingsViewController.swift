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
        // Retrieve the default tip percentage
        defaultTipControl.selectedSegmentIndex
            = NSUserDefaults.standardUserDefaults().integerForKey("defaultTipControlIndex")
        super.viewDidLoad()
    }
    
    @IBAction func onBackCicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipControlIndex")
        defaults.synchronize()
    }

}
