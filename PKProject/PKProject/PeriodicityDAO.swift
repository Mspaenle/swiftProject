//
//  PeriodicityDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Periodicity{
    static func getNewPeriodicityDAO() -> Periodicity?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Periodicity", in: CoreDataManager.context) else {
            return nil
        }
        return Periodicity(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func create() -> Periodicity{
        return Periodicity(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
}
