//
//  ListDrugIntakeModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 07/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData

class ListDrugIntakeModel{
    var lIntake : [DrugIntake] = []
    
    /// 'ListDrugIntakeModel' x 'StateModel' -> 'ListDrugIntakeModel' -- add a State to the collection, return the collection
    ///
    /// - Parameter state: 'StateModel' to be added to the set
    /// - Returns: 'ListDrugIntakeModel' with new 'State' added to the set
    @discardableResult
    func add(number: DrugIntake) -> ListDrugIntakeModel{
        self.lIntake.append(number)
        return self
    }
    
    /// `ListDrugIntakeModel` x `EmergencyNumber` -> `ListDrugIntakeModel` -- if `EmergencyNumber` belongs to `ListDrugIntakeModel`, remove it from the set, else do nothing
    ///
    /// - Parameter number: `EmergencyNumber` to be removed
    /// - Returns: `ListDrugIntakeModel` with `EmergencyNumber` removed if `EmergencyNumber` belonged to `ListDrugIntakeModel`
    @discardableResult
    func remove(number: DrugIntake) -> ListDrugIntakeModel{
        if let i = self.lIntake.index(of: number){
            self.lIntake.remove(at: i)
        }
        return self
    }
    
    /// number of elements in the set
    var count: Int{
        return self.lIntake.count
    }
    
    subscript(index: Int) -> DrugIntake {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lIntake[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lIntake[index]=newValue
        }
    }
    
    /// `ListState` -> `ItListState` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListDrugIntake{
        return ItListDrugIntake(self)
    }
    
}

// MARK: -

/// Iterator on ListDrugIntake
struct ItListDrugIntake : IteratorProtocol{
    private var current: Int = 0
    private let set: ListDrugIntakeModel
    
    init(_ s: ListDrugIntakeModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListDrugIntake{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> DrugIntake? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextDrugIntake = self.set.lIntake[self.current]
        self.current += 1
        return nextDrugIntake
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}

