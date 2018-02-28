//
//  State.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

/**
 State type
 
 **date**: State -> Date
 **stateValue**: State -> Int
 */
class State {
    
    var date : Date
    var stateValue : Int
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - date: <#date description#>
    ///   - stateValue: <#stateValue description#>
    init(date : Date, stateValue : Int){
        self.date=date
        self.stateValue=stateValue
    }
    
    
    
}
