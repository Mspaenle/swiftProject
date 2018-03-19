//
//  RDVDAO.swift
//  PKProject
//
//  Created by Mahé on 19/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension RDV{
    static func getNewRDVDAO() -> RDV?{
        guard let entity = NSEntityDescription.entity(forEntityName: "RDV", in: CoreDataManager.context) else {
            return nil
        }
        return RDV(entity: entity, insertInto : CoreDataManager.context)
    }
}
