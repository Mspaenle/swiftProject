//
//  MedDAO.swift
//  PKProject
//
//  Created by Mahé on 19/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension Med{
    static func getNewMedDAO() -> Med?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Med", in: CoreDataManager.context) else {
            return nil
        }
        return Med(entity: entity, insertInto : CoreDataManager.context)
    }
}
