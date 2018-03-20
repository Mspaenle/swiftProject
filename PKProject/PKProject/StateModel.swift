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

enum StateValue : String{
    case on  = "On"
    case off = "Off"
    case dys = "Dyskinésie"
}

class StateModel{
    internal var dao : State
    
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
    }
    
    var value: StateValue {
        get{
            let val = self.dao.value!
            if val == "On" {
                return .on
            } else if val == "Off" {
                return .off
            } else {
                return .dys
            }
        }
    }
    
    init(date : Date, stateValue : StateValue){
        self.dao = State.create()
        self.dao.date=date as NSDate
        self.dao.value=stateValue.rawValue
    }
}
