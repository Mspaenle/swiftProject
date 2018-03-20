//
//  ActivityModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ActivityModel{
    internal var dao : Activity
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
        set{
            self.dao.date = newValue as NSDate
        }
    }
    
    var title: String {
        get{
            return self.dao.title!
        }
    }
    
    var specification: String {
        get{
            return self.dao.specification!
        }
        set{
            self.dao.specification = newValue
        }
    }
    
    var duration: Int16 {
        get{
            return self.dao.duration
        }
        set{
            self.dao.duration = newValue
        }
    }
    
    private var periodicityModel : PeriodicityModel
    
    var periodicity: PeriodicityModel{
        get{
            return self.periodicityModel
        }
        set{
            self.periodicityModel = newValue
            self.dao.periodicity = periodicityModel.dao
        }
    }
    
    
    init(date : NSDate, title : String, specification : String, duration : Int16, periodicity: PeriodicityModel){
        let entity = CoreDataManager.entity(forName: "Activity")
        self.dao = Activity(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.title=title
        self.dao.specification=specification
        self.periodicityModel = periodicity
        self.dao.periodicity = periodicity.dao
        
    }
}
