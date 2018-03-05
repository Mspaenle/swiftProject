//
//  Event.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

/**
 Event type
 
 **date**: Event -> Date
 **titleEvent : Event -> String
 
 */


class Event {
    

        let date : Date
        let titleEvent : Int
        
        
        /// Description
        ///
        /// - Parameters:
        ///   - date: date of the 'Event'
        ///   - titleEvent: title of the 'Event'
        
        init(date : Date, titleEvent : Int){
                self.date=date
                self.titleEvent=titleEvent
        }

}
