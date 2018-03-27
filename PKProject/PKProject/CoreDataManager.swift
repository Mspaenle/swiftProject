//
//  CoreDataManager.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/// Links the DAO with the Data Base
class CoreDataManager{
    
    public static let context : NSManagedObjectContext  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    public static func entity(forName name: String) -> NSEntityDescription{
        guard let entity = NSEntityDescription.entity(forEntityName: name, in: self.context) else{
            fatalError()
        }
        return entity
    }
    
    class func save() throws {
        do {
            try CoreDataManager.context.save()
        } catch let error as NSError {
            throw error
        }
    }
    class func delete(object: NSManagedObject) throws {
            CoreDataManager.context.delete(object)

    }
    
}
