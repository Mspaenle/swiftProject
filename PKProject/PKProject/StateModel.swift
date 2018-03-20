//
//  StateModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class StateModel{
    internal var dao : State
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
    }
    
    var value: String {
        get{
            return self.dao.value!
        }
    }
    
    init(date : NSDate, stateValue : String){
        let entity = CoreDataManager.entity(forName: "State")
        self.dao = State(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.value=stateValue
    }
    
}
