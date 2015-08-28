

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
        let rootViewController: UIViewController = storyBoard.instantiateViewControllerWithIdentifier("VC")
        
        navigationController.viewControllers = [rootViewController]
        self.window?.rootViewController = navigationController
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Save the current date before app resigns
        let defaults = NSUserDefaults.standardUserDefaults()
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
        let nav = self.window?.rootViewController as! UINavigationController
        let vc = nav.viewControllers.first as! ViewController
        
        // If a timestamp and bill amount was saved, then restore view if < 10 min
        if let billField = vc.valueForKey("billField") as? UITextField{
            if let lastSavedDate = NSUserDefaults.standardUserDefaults().valueForKey("lastSavedDate") as? NSDate
            {
                let timeInterval = NSDate().timeIntervalSinceDate(lastSavedDate);
                if timeInterval > 600 {
                    NSUserDefaults.standardUserDefaults().removeObjectForKey("lastBillAmount")
                }
                
                vc.showInitialView(true)
            }
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

