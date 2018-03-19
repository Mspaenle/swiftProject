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
}
