//
//  DosesDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Dose{
    static func getNewDoseDAO() -> Dose?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Dose", in: CoreDataManager.context) else {
            return nil
        }
        return Dose(entity: entity, insertInto : CoreDataManager.context)
    }
}
