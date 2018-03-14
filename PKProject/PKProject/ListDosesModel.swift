//
//  ListDosesModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 10/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ListDoses {
var ldoses : [Dose] = []

//
//*add* : ListDoses x Dose -> ListDoses -- add a Dose in ListDoses
//
// - Parameter dose : Dose to be added
// - Returns: `ListDoses` with new `Dose` added to the set
//
@discardableResult
func add(dose: Dose) -> ListDoses{
    self.ldoses.append(dose)
    return self
}

//
//*remove* : ListDoseModel x DoseModel -> ListDoseModel -- remove a DoseModel from the ListDoseModel
//
// - Parameter dose: `Dose` to be removed
// - Returns: `ListDoses` with `Doses` removed if `Dose` belonged to `ListDoses`
//

@discardableResult
func remove(number: Dose) -> ListDoses{
    if let i = self.ldoses.index(of: number){
        self.ldoses.remove(at: i)
    }
    return self
}


/// number of elements in the set
var count: Int{
    return self.ldoses.count
}

subscript(index: Int) -> Dose {
    get {
        guard (index>=0) && (index<self.count) else{
            fatalError("index out of range")
        }
        return self.ldoses[index]
    }
    set(newValue) {
        guard (index>=0) && (index<self.count) else{
            fatalError("index out of range")
        }
        self.ldoses[index]=newValue
    }
}


/// `ListDoses` -> `ItListDoses` -- make an iterator on the set
///
/// - Returns: a new iterator on the set initialized on the first element
func makeIterator() -> ItListDoses{
    return ItListDoses(self)
}
}


// MARK: -

/// Iterator on ListDoses
struct ItListDoses : IteratorProtocol{
    private var current: Int = 0
    private let set: ListDoses
    
    init(_ s: ListDoses){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListDoses{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> Dose? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextDose = self.set.ldoses[self.current]
        self.current += 1
        return nextDose
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}

