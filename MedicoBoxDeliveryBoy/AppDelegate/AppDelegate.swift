//
//  AppDelegate.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate, GMSMapViewDelegate {

    var window: UIWindow?
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    //    var gmsMapview =  GMSMapView()
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = #colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)
        navigationBarAppearace.barTintColor = #colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)
        
//        Fabric.with([Crashlytics.self])
        // TODO: Move this to where you establish a user session
//        self.logUser()
        GMSServices.provideAPIKey("AIzaSyAEYUQY-2jBCToQLrWcc56s50_CAihzthk")
        GMSPlacesClient.provideAPIKey("AIzaSyAEYUQY-2jBCToQLrWcc56s50_CAihzthk")
        return true
    }

//    func logUser() {
//        // TODO: Use the current user's information
//        // You can call any combination of these three methods
//        Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
//        Crashlytics.sharedInstance().setUserIdentifier("12345")
//        Crashlytics.sharedInstance().setUserName("Test User")
//    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    //    Pragma Mark: create menu
    func createMenuView() {
        
        // create viewController code...
        
        let homeViewController = kMainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let leftViewController = kMainStoryboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: homeViewController)
        
        UINavigationBar.appearance().tintColor = UIColor(hex: "689F38")
        
        leftViewController.homeViewController = nvc
        
        let slideMenuController = ExSlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = homeViewController as? SlideMenuControllerDelegate
        
        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
    }
}

