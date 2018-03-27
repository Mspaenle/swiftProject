//
//  RDVDAO.swift
//  PKProject
//
//  Created by Mahé on 19/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// DAO Extension to access the data base
extension RDV{
    
    static func getNewRDVDAO() -> RDV?{
        guard let entity = NSEntityDescription.entity(forEntityName: "RDV", in: CoreDataManager.context) else {
            return nil
        }
        return RDV(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func create() -> RDV{
        return RDV(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
    static func delete(object: RDV){
        
        do{
            try CoreDataManager.delete(object: object)
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
    
}
