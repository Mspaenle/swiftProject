//
//  ListStateModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 07/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//


import Foundation
import CoreData

/**
 ListStateModel type
 
 *add*: 'ListStateModel' x 'StateModel' -> 'ListStateModel' -- add a StateModel to the collection
 
 */
class ListState : Sequence {
    var lstate : [State] = []
    
    /// 'ListStateModel' x 'StateModel' -> 'ListStateModel' -- add a State to the collection, return the collection
    ///
    /// - Parameter state: 'StateModel' to be added to the set
    /// - Returns: 'ListStateModel' with new 'State' added to the set
    @discardableResult
    func add(state: State) -> ListState{
        self.lstate.append(state)
        return self
    }
    
    /// number of elements in the set
    var count: Int{
        return self.lstate.count
    }
    
    subscript(index: Int) -> State {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lstate[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lstate[index]=newValue
        }
    }
    
    /// `ListState` -> `ItListState` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListState{
        return ItListState(self)
    }
    
}

// MARK: -

/// Iterator on ListState
struct ItListState : IteratorProtocol{
    private var current: Int = 0
    private let set: ListState
    
    init(_ s: ListState){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListState{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> State? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextState = self.set.lstate[self.current]
        self.current += 1
        return nextState
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}
