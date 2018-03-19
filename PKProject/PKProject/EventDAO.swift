//
//  EventDAO.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Event{
    static func getNewEventDAO() -> Event?{
        guard let entity = NSEntityDescription.entity(forEntityName: "Event", in: CoreDataManager.context) else {
            return nil
        }
        return Event(entity: entity, insertInto : CoreDataManager.context)
    }
}
