//
//  EmergencyNumberDAO.swift
//  PKProject
//
//  Created by Chloe DALGER on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// DAO Extension to access the data base
extension EmergencyNumber{
    
    static func getNewEmergencyNumberDAO() -> EmergencyNumber?{
        guard let entity = NSEntityDescription.entity(forEntityName: "EmergencyNumber", in: CoreDataManager.context) else {
            return nil
        }
        return EmergencyNumber(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func create() -> EmergencyNumber{
        return EmergencyNumber(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func delete(object: EmergencyNumber){
        
        do{
            try CoreDataManager.delete(object: object)
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
}
