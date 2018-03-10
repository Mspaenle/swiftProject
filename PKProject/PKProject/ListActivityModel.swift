//
//  ListActivityModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation



//
//Set of 'ActivityModel's
//
//*addActivity* : ListActivityModel x ActivityModel -> ListActivityModel -- add a ActivityModel in ListActivityModel
//
//*removeActivity* : ListActivityModel x ActivityModel -> ListActivityModel -- remove a ActivityModel from the ListActivityModel
//
//*getItActivity* : ListActivityModel -> ItListActivity -- Initialise the iterator  of the collection in the parameters, if the collection is'nt empty, the current element is the first element of the colletion and the iterator is Active otherwise the iterator is Inactive
//

class ListActivityModel : Sequence {
    fileprivate var lactivity : [Activity] = []
    
    /// Description
    ///
    /// - Parameter ActivityModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*addActivity* : ListActivityModel x ActivityModel -> ListActivityModel -- add a ActivityModel in ListActivityModel
    //
    // - Parameter activity: `ActivityModel` to be added
    // - Returns: `ListActivityModel` with new `ActivityModel` added to the set
    //
    
    @discardableResult
    func add(activity: Activity) -> ListActivityModel{
        self.lactivity.append(activity)
        return self
    }
    
    //
    //*removeActivity* : ListActivityModel x ActivityModel -> ListActivityModel -- remove a ActivityModel from the ListActivityModel
    //
    // - Parameter activity: `ActivityModel` to be removed
    // - Returns: `ListActivityModel` with `ActivityModel` removed if `ActivityModel` belonged to `ListActivityModel`
    //
    
    @discardableResult
    func remove(activity: Activity) -> ListActivityModel{
        if let i = self.lactivity.index(of: activity){
            self.lactivity.remove(at: i)
        }
        return self
    }
    
    
    /// number of elements in the set
    var count: Int{
        return self.lactivity.count
    }
    
    subscript(index: Int) -> Activity {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.lactivity[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.lactivity[index]=newValue
        }
    }
    
    
    /// `ListActivityModel` -> `ItListActivity` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListActivity{
        return ItListActivity(self)
    }
}


// MARK: -

/// Iterator on ListActivityModel
struct ItListActivity : IteratorProtocol{
    private var current: Int = 0
    private let set: ListActivityModel
    
    fileprivate init(_ s: ListActivityModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListActivity{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> Activity? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextActivity = self.set.lactivity[self.current]
        self.current += 1
        return nextActivity
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}
