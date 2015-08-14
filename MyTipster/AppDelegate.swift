

//
//  AppDelegate.swift
//  MyTipster
//
//  Created by Vicki Chun on 8/1/15.
//  Copyright (c) 2015 Vicki Grospe. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController: UINavigationController = storyBoard.instantiateInitialViewController() as! UINavigationController
        // Get the viewController with the id "VC"
        let rootViewController: UIViewController = storyBoard.instantiateViewControllerWithIdentifier("VC")as! UIViewController
        
        navigationController.viewControllers = [rootViewController]
        self.window?.rootViewController = navigationController
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Save the current date and bill amount
        var defaults = NSUserDefaults.standardUserDefaults()
        var nav = self.window?.rootViewController as! UINavigationController
        var vc = nav.viewControllers.first as! UIViewController
        
        var billField: UITextField = vc.valueForKey("billField") as! UITextField
        var billValue = billField.text
        
        defaults.setValue(billValue, forKey: "lastBillAmount")
        defaults.setValue(NSDate(), forKey: "lastSavedDate")
        defaults.synchronize()
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var nav = self.window?.rootViewController as! UINavigationController
        var vc = nav.viewControllers.first as! ViewController
        var billField: UITextField = vc.valueForKey("billField") as! UITextField
        println("app active");

        // If a timestamp was saved previously, then retrieve it
        if let lastSavedDate: NSDate = defaults.valueForKey("lastSavedDate") as? NSDate
        {
            var timeInterval : NSTimeInterval = lastSavedDate.timeIntervalSinceNow
            if timeInterval > -600 {
                // Less than 10 minutes, restore last bill amount
                billField.text = defaults.valueForKey("lastBillAmount") as! String
            } else {
                // More than 10 minutes, clear fields
                billField.text = ""
            }
            vc.showInitialView()
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

