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

extension DrugIntake{
    static func getNewDrugIntakeDAO() -> DrugIntake?{
        guard let entity = NSEntityDescription.entity(forEntityName: "DrugIntake", in: CoreDataManager.context) else {
            return nil
        }
        return DrugIntake(entity: entity, insertInto : CoreDataManager.context)
    }
}
