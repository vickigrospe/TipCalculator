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

        var defaults = NSUserDefaults.standardUserDefaults()
        var savedTipControlIndex = defaults.integerForKey("defaultTipControlIndex")
        defaultTipControl.selectedSegmentIndex = savedTipControlIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChanged(sender: AnyObject) {
        println("default tip changed")
        
        var defaults = NSUserDefaults.standardUserDefaults()
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
