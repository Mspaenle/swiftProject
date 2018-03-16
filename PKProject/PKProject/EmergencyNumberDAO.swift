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

extension EmergencyNumber{
    static func getNewStateDAO() -> EmergencyNumber?{
        guard let entity = NSEntityDescription.entity(forEntityName: "EmergencyNumber", in: CoreDataManager.context) else {
            return nil
        }
        return EmergencyNumber(entity: entity, insertInto : CoreDataManager.context)
    }
}
