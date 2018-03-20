//
//  EventModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EventModel {
    private var dao : Event
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
        set{
            self.dao.date = newValue as NSDate
        }
    }
    
    var value: String {
        get{
            return self.dao.value!
        }
        set{
            self.dao.value = newValue
        }
    }
    
    init(date : NSDate, stateValue : String){
        let entity = CoreDataManager.entity(forName: "Event")
        self.dao = Event(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.value=stateValue
    }
}
