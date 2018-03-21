//
//  DoctorDAO.swift
//  PKProject
//
//  Created by Chloe DALGER on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


import Foundation
import CoreData
import UIKit

extension Doctor{
    static func getNewDoctorDAO() -> Doctor?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Doctor", in: CoreDataManager.context) else {
            return nil
        }
        return Doctor(entity: entity, insertInto : CoreDataManager.context)
    }
    
    static func create() -> Doctor{
        return Doctor(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }

}
