//
//  ActivityDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Activity{
    static func getNewActivityDAO() -> Activity?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Activity", in: CoreDataManager.context) else {
            return nil
        }
        return Activity(entity: entity, insertInto : CoreDataManager.context)
    }
    static func create() -> Activity{
        return Activity(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }
}
