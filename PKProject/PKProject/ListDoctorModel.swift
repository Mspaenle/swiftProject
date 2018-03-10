//
//  ListDoctorModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


//
//Set of 'DoctorModel's
//
//*addDoctor* : ListDoctorModel x DoctorModel -> ListDoctorModel -- add a DoctorModel in ListDoctorModel
//
//*removeDoctor* : ListDoctorModel x DoctorModel -> ListDoctorModel -- remove a DoctorModel from the ListDoctorModel
//
//*getItDoctor* : ListDoctorModel -> ItListDoctor -- Initialise the iterator  of the collection in the parameters, if the collection is'nt empty, the current element is the first element of the colletion and the iterator is Active otherwise the iterator is Inactive
//

class ListDoctorModel : Sequence {
    fileprivate var ldoctor : [DoctorModel] = []
    
    /// Description
    ///
    /// - Parameter DoctorModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*addDoctor* : ListDoctorModel x DoctorModel -> ListDoctorModel -- add a DoctorModel in ListDoctorModel
    //
    // - Parameter doctor: `DoctorModel` to be added
    // - Returns: `ListDoctorModel` with new `DoctorModel` added to the set
    //
    
    @discardableResult
    func add(doctor: DoctorModel) -> ListDoctorModel{
        self.ldoctor.append(doctor)
        return self
    }
    
    //
    //*removeDoctor* : ListDoctorModel x DoctorModel -> ListDoctorModel -- remove a DoctorModel from the ListDoctorModel
    //
    // - Parameter doctor: `DoctorModel` to be removed
    // - Returns: `ListDoctorModel` with `DoctorModel` removed if `DoctorModel` belonged to `ListDoctorModel`
    //
    @discardableResult
    func remove(number: DoctorModel) -> ListDoctorModel{
        if let i = self.ldoctor.index(of: number){
            self.ldoctor.remove(at: i)
        }
        return self
    }
    

    
    
    subscript(index: Int) -> DoctorModel {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.ldoctor[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.ldoctor[index]=newValue
        }
    }
    
    /// number of elements in the set
    var count: Int{
        return self.ldoctor.count
    }
    
    /// `ListDoctorModel` -> `ItListDoctor` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    /// number of elements in the set
    func makeIterator() -> ItListDoctor{
        return ItListDoctor(self)
    }
}


// MARK: -

/// Iterator on ListDoctorModel
struct ItListDoctor : IteratorProtocol{
    private var current: Int = 0
    private let set: ListDoctorModel
    
    fileprivate init(_ s: ListDoctorModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListDoctor{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> DoctorModel? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextDoctor = self.set.ldoctor[self.current]
        self.current += 1
        return nextDoctor
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}
