//
//  JournalDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 26/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// DAO Extension to access the data base
extension Journal{
    
    static func getNewJournalDAO() -> Journal?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Journal", in: CoreDataManager.context) else {
            return nil
        }
        return Journal(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func create() -> Journal{
        return Journal(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }

}
