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
    
    let date : Date
    let stateValue : Int
    
    
    /// <#Description#>
    ///
    /// - Preconditions : stateValue must be 0, 1 or 2
    /// - Parameters:
    ///   - date: <#date description#>
    ///   - stateValue: <#stateValue description#>
    
    init?(date : Date, stateValue : Int){
        if (stateValue != 0 && stateValue != 1 && stateValue != 2){ return nil }
        else {
            self.date=date
            self.stateValue=stateValue
        }
    }
    
    
}
