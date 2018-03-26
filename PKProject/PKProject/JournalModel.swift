//
//  JournalModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 26/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class JournalModel {
    private var dao : Journal;
    
    var number: String {
        get{
            return self.dao.number!
        }
        set{
            self.dao.number = newValue
        }
    }
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
        set{
            self.dao.date = newValue as NSDate
        }
    }
    
    init(number: String, date: Date){
        self.dao = Journal.create()
        self.dao.number = number
        self.dao.date = date as NSDate
    }
}
