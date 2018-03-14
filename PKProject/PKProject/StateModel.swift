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
    private var dao : State
    
    var date: NSDate? {
        get{
            return self.dao.date
        }
        set{
            self.dao.date = newValue
        }
    }
    
    var value: String? {
        get{
            return self.dao.value
        }
        set{
            self.dao.value = newValue
        }
    }
    
    init(date : NSDate, stateValue : String){
        let entity = CoreDataManager.entity(forName: "State")
        self.dao = State(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.value=stateValue
    }
    
}
