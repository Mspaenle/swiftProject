//
//  EventModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

/**
 EventModel type
 
 **date**: EventModel -> Date
 **titleEvent : EventModel -> String
 
 */


class EventModel {
    
    
    let date : Date
    let titleEvent : Int
    
    
    /// Description
    ///
    /// - Parameters:
    ///   - date: date of the 'EventModel'
    ///   - titleEvent: title of the 'EventModel'
    
    init(date : Date, titleEvent : Int){
        self.date=date
        self.titleEvent=titleEvent
    }
    
}
