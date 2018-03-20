//
//  EmergencyNumberModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EmergencyNumberModel{
    internal var dao : EmergencyNumber
    
    var phoneNumber: String {
        get{
            return self.dao.phoneNumber!
        }
        set{
            self.dao.phoneNumber = newValue
        }
    }
    
    var title: String? {
        get{
            return self.dao.title!
        }
        set{
            self.dao.title = newValue
        }
    }
    
    init(phoneNumber : String, title : String){
        let entity = CoreDataManager.entity(forName: "EmergencyNumber")
        self.dao = EmergencyNumber(entity: entity, insertInto: CoreDataManager.context)
        self.dao.phoneNumber = phoneNumber
        self.dao.title = title
    }
}
