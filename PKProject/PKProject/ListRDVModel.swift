//
//  ListRDVModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation



//
//Set of 'RDVModel's
//
//*addRDV* : ListRDVModel x RDVModel -> ListRDVModel -- add a RDVModel in ListRDVModel
//
//*removeRDV* : ListRDVModel x RDVModel -> ListRDVModel -- remove a RDVModel from the ListRDVModel
//
//*getItRDV* : ListRDVModel -> ItListRDV -- Initialise the iterator  of the collection in the parameters, if the collection is'nt empty, the current element is the first element of the colletion and the iterator is Active otherwise the iterator is Inactive
//

class ListRDV : Sequence {
    var lrdv : [RDV] = []
    
    /// Description
    ///
    /// - Parameter RDVModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*addRDV* : ListRDVModel x RDVModel -> ListRDVModel -- add a RDVModel in ListRDVModel
    //
    // - Parameter rdv: `RDVModel` to be added
    // - Returns: `ListRDVModel` with new `RDVModel` added to the set
    //
    
    @discardableResult
    func add(rdv: RDV) -> ListRDV{
        self.lrdv.append(rdv)
        return self
    }
    

    //
    //*removeRDV* : ListRDVModel x RDVModel -> ListRDVModel -- remove a RDVModel from the ListRDVModel
    //
    // - Parameter rdv: `RDVModel` to be removed
    // - Returns: `ListRDVModel` with `RDVModel` removed if `RDVModel` belonged to `ListRDVModel`
    //
    
    @discardableResult
    func remove(rdv: RDV) -> ListRDV{
        if let i = self.lrdv.index(of: rdv){
            self.lrdv.remove(at: i)
        }
        return self
    }
    
    /// number of elements in the set
    var count: Int{
        return self.lrdv.count
    }
    
    
    
    subscript(index: Int) -> RDV {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lrdv[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lrdv[index]=newValue
        }
    }
    
    
    /// `ListRDVModel` -> `ItListRDV` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListRDV{
        return ItListRDV(self)
    }
}


// MARK: -

/// Iterator on ListRDVModel
struct ItListRDV : IteratorProtocol{
    private var current: Int = 0
    private let set: ListRDV
    
    init(_ s: ListRDV){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListRDV{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> RDV? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextRDV = self.set.lrdv[self.current]
        self.current += 1
        return nextRDV
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}
