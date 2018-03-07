//
//  ListMedModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


//
//Set of 'MedModel's
//
//*addMed* : ListMedModel x MedModel -> ListMedModel -- add a MedModel in ListMedModel
//
//*removeMed* : ListMedModel x MedModel -> ListMedModel -- remove a MedModel from the ListMedModel
//
//*getItMed* : ListMedModel -> ItListMed -- Initialise the iterator  of the collection in the parameters, if the collection is'nt empty, the current element is the first element of the colletion and the iterator is Active otherwise the iterator is Inactive
//

class ListMedModel : Sequence {
    var lmed : [MedModel] = []
    
    //
    //*add* : ListMedModel x MedModel -> ListMedModel -- add a MedModel in ListMedModel
    //
    // - Parameter med: `MedModel` to be added
    // - Returns: `ListMedModel` with new `MedModel` added to the set
    //
    @discardableResult
    func add(med: MedModel) -> ListMedModel{
        self.lmed.append(med)
        return self
    }
    
    //
    //*remove* : ListMedModel x MedModel -> ListMedModel -- remove a MedModel from the ListMedModel
    //
    // - Parameter med: `MedModel` to be removed
    // - Returns: `ListMedModel` with `MedModel` removed if `MedModel` belonged to `ListMedModel`
    //
    
    @discardableResult
    func remove(number: MedModel) -> ListMedModel{
        if let i = self.lmed.index(of: number){
            self.lmed.remove(at: i)
        }
        return self
    }
    
    
    /// number of elements in the set
    var count: Int{
        return self.lmed.count
    }
    
    subscript(index: Int) -> MedModel {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lmed[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lmed[index]=newValue
        }
    }
    
    
    /// `ListMedModel` -> `ItListMed` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListMed{
        return ItListMed(self)
    }
}


// MARK: -

/// Iterator on ListMedModel
struct ItListMed : IteratorProtocol{
    private var current: Int = 0
    private let set: ListMedModel
    
    init(_ s: ListMedModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListMed{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> MedModel? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextMed = self.set.lmed[self.current]
        self.current += 1
        return nextMed
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}
