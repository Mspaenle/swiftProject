//
//  StateDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension State{
    static func getNewStateDAO() -> State?{
        guard let entity = NSEntityDescription.entity(forEntityName: "State", in: CoreDataManager.context) else {
            return nil
        }
        return State(entity: entity, insertInto : CoreDataManager.context)
    }
}
