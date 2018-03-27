//
//  DrugIntakeDAO.swift
//  PKProject
//
//  Created by Mahé on 19/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// DAO Extension to access the data base
extension DrugIntake{
    
    static func getNewDrugIntakeDAO() -> DrugIntake?{
        guard let entity = NSEntityDescription.entity(forEntityName: "DrugIntake", in: CoreDataManager.context) else {
            return nil
        }
        return DrugIntake(entity: entity, insertInto : CoreDataManager.context)
    }

    static func create() -> DrugIntake{
        return DrugIntake(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func delete(object: DrugIntake){
        do{
            try CoreDataManager.delete(object: object)
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }

}
