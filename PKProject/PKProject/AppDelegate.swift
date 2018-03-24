//
//  AppDelegate.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
        }
        else {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            //Seeders
            MedModel(name: "Modopar", specification: "", doses: ["62,5","125","250"])
            MedModel(name: "Modopar LP", specification: "", doses: ["125"])
            MedModel(name: "Modopar Dispersible", specification: "", doses: ["125"])
            MedModel(name: "Sinemet", specification: "", doses: ["100","250"])
            MedModel(name: "Sienmet LP", specification: "", doses: ["100","200"])
            MedModel(name: "Stavelo", specification: "", doses: ["50","75","100","125","150","175","200"])
            MedModel(name: "Parlodel", specification: "", doses: ["2,5","5","10"])
            MedModel(name: "Trivastal", specification: "", doses: ["20"])
            MedModel(name: "Trivastal LP", specification: "", doses: ["50"])
            MedModel(name: "Sifrol", specification: "", doses: ["0,18","0,7"])
            MedModel(name: "Sifrol LP", specification: "", doses: ["0,26","0,52","1,05","2,1"])
            MedModel(name: "Requip", specification: "", doses: ["0,25","0,5","1","2","5"])
            MedModel(name: "Requip LP", specification: "", doses: ["2","4","8"])
            MedModel(name: "Neupro (Patch)", specification: "", doses: ["2","4","6","8"])
            MedModel(name: "Mantadix", specification: "", doses: ["100"])
            MedModel(name: "Azilect", specification: "", doses: ["1"])
            MedModel(name: "Comtan", specification: "", doses: ["200"])
            MedModel(name: "Artane", specification: "", doses: ["2","5"])
            MedModel(name: "Parkinane LP", specification: "", doses: ["2","5"])
            MedModel(name: "Lepticur", specification: "", doses: ["10"])
            MedModel(name: "Exelon", specification: "", doses: ["1,5","3","4,5","6"])
            MedModel(name: "Exelon (Patch)", specification: "", doses: ["4,6","9,5"])
            
        }
        return true
    }

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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PKProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

