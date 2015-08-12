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
        let rootViewController: UIViewController = storyBoard.instantiateViewControllerWithIdentifier("VC")as! UIViewController
        
        navigationController.viewControllers = [rootViewController]
        self.window?.rootViewController = navigationController
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        println("app will resign")
        // Save the current date
        var defaults = NSUserDefaults.standardUserDefaults()
        
        
        // save bill amt
        //var billValue = theViewController.billField?.text
        //println("the bill value is " + billValue!)
        //defaults.setValue(billvalue!, forKey: "lastBillAmount")
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
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let lastSavedDate: NSDate = defaults.valueForKey("lastSavedDate") as? NSDate
        {
            var timeInterval: NSTimeInterval = lastSavedDate.timeIntervalSinceNow
            if timeInterval < 600 {
                // Less than 10 minutes then restore last bill amount
                println("less then 10 min")
            } else {
                // clear bill amount
                println("more than 10 min")
            }
        }
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

