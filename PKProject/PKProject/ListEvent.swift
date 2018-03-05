//
//  ListEvent.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

class ListEvent : Sequence {
    var levent : [Event] = []
    
    /// Description
    ///
    /// - Parameter event: <#state description#>
    /// - Returns: <#return value description#>
    func add(state: Event) -> ListEvent{
        self.levent.append(Event)
    }
}
