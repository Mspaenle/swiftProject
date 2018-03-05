//
//  ListState.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

class ListState : Sequence {
    var lstate : [State] = []
    
    /// <#Description#>
    ///
    /// - Parameter state: <#state description#>
    /// - Returns: <#return value description#>
    func add(state: State) -> ListState{
        self.pset.append(State)
    }
}
