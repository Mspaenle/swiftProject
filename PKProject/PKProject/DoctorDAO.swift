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
    static func getNewStateDAO() -> State?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Doctor", in: CoreDataManager.context) else {
            return nil
        }
        return Doctor(entity: entity, insertInto : CoreDataManager.context)
    }
}
