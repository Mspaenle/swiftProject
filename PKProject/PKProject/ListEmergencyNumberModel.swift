//
//  ListEmergencyNumberModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 07/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData

class ListEmergencyNumberModel{
    var lNumber : [EmergencyNumber] = []
    
    /// 'ListEmergencyNumberModel' x 'StateModel' -> 'ListEmergencyNumberModel' -- add a State to the collection, return the collection
    ///
    /// - Parameter state: 'StateModel' to be added to the set
    /// - Returns: 'ListEmergencyNumberModel' with new 'State' added to the set
    @discardableResult
    func add(number: EmergencyNumber) -> ListEmergencyNumberModel{
        self.lNumber.append(number)
        return self
    }
    
    /// `ListEmergencyNumberModel` x `EmergencyNumber` -> `ListEmergencyNumberModel` -- if `EmergencyNumber` belongs to `ListEmergencyNumberModel`, remove it from the set, else do nothing
    ///
    /// - Parameter number: `EmergencyNumber` to be removed
    /// - Returns: `ListEmergencyNumberModel` with `EmergencyNumber` removed if `EmergencyNumber` belonged to `ListEmergencyNumberModel`
    @discardableResult
    func remove(number: EmergencyNumber) -> ListEmergencyNumberModel{
        if let i = self.lNumber.index(of: number){
            self.lNumber.remove(at: i)
        }
        return self
    }
    
    /// number of elements in the set
    var count: Int{
        return self.lNumber.count
    }
    
    subscript(index: Int) -> EmergencyNumber {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lNumber[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lNumber[index]=newValue
        }
    }
    
    /// `ListState` -> `ItListState` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListEmergencyNumber{
        return ItListEmergencyNumber(self)
    }
    
}

// MARK: -

/// Iterator on ListEmergencyNumber
struct ItListEmergencyNumber : IteratorProtocol{
    private var current: Int = 0
    private let set: ListEmergencyNumberModel
    
    init(_ s: ListEmergencyNumberModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListEmergencyNumber{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> EmergencyNumber? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextEmergencyNumber = self.set.lNumber[self.current]
        self.current += 1
        return nextEmergencyNumber
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}

