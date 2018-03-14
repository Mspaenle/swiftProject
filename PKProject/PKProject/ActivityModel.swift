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
    private var dao : Activity
    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    var title: String {
        get{
            return self.dao.title!
        }
        set{
            self.dao.title = newValue
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
    
    var periodicity: Periodicity{
        get{
            return self.dao.periodicity!
        }
        set{
            self.dao.periodicity = newValue
        }
    }
    
    
    init(date : NSDate, title : String, specification : String, duration : Int16, periodicity: Periodicity){
        let entity = CoreDataManager.entity(forName: "Activity")
        self.dao = Activity(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date=date
        self.dao.title=title
        self.dao.specification=specification
        
    }
}
