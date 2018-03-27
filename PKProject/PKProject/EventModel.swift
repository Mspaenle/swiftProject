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

enum EventValue : String{
    case somnolence  = "Somnolence"
    case chute = "Chute"
    case hallucination = "Hallucination"
    case prise = "Prise de dispersible"
    case clic = "Clic / bolus d'Apokinon"
}

/// Event Model represent an event that happened at a given date and time
class EventModel  {
    
    private var dao : Event
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
    }
    
    var value: EventValue {
        get{
            let val = self.dao.value!
            if val == "Somnolence" {
                return .somnolence
            } else if val == "Chute" {
                return .chute
            } else if val == "Hallucination" {
                return .hallucination
            } else if val == "Prise de dispersible" {
                return .prise
            } else {
                return .clic
            }
        }
    }
    
    init(date : Date, eventValue : EventValue){
        self.dao = Event.create()
        self.dao.date=date as NSDate
        self.dao.value=eventValue.rawValue
    }
    
}
