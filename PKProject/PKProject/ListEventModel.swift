//
//  ListEventModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

//
//Set of 'EventModel's
//
//*addEvent* : ListEventModel x EventModel -> ListEventModel -- add an event in ListEventModel
//
//*getEvent* : ListEventModel x Date -> ListEventModel -- get EventModel according to a date
//
//*getDateEvent* : ListEventModel x Date -> ListEventModel -- get a ListEventModel according to a date
//
//*getFrequencyEvent* : ListEventModel x String -> int -- get the frequency of an EventModel
//
//*countEvent* : ListEventModel x String -> int -- occurence of an EventModel in a ListEventModel
//
//*getItEvent* : ListEventModel -> ItListEvent -- Initialise the iterator  of the collection in the parameters, if the collection is'nt empty, the current element is the first element of the colletion and the iterator is Active otherwise the iterator is Inactive
//

class ListEventModel : Sequence {
    fileprivate var levent : [EventModel] = []
    
    /// Description
    ///
    /// - Parameter EventModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*addEvent* : ListEventModel x EventModel -> ListEventModel -- add an EventModel in ListEventModel
    //
    // - Parameter event: `EventModel` to be added
    // - Returns: `ListEventModel` with new `EventModel` added to the set
    //
    
    @discardableResult
    func addEvent(event: EventModel) -> ListEventModel{
        self.levent.append(event)
        return self
    }
    
    //
    //*getEvent* : ListEventModel x Date -> ListEventModel -- get EventModel since a date
    //
    // - Parameter date: Date to be looked for
    // - Returns: ListEventModel will all `EventModel` conforming to parameter
    //
    
    func getEvent(forEventDate date: Date) -> ListEventModel{
        let ret : ListEventModel = ListEventModel()
        for e in self{
            if( e.date <= date ){
                ret.add(event: e)
            }
        }
        return ret
    }
    
    //
    //*getDateEvent* : ListEventModel x Date -> ListEventModel -- get a ListEventModel according to a date
    //
    // - Parameter date: Date to be looked for
    // - Returns: ListEventModel will all `EventModel` conforming to parameter
    //
    
    func getDateEvent(forEventDate date: Date) -> ListEventModel{
        let ret : ListEventModel = ListEventModel()
        for e in self{
            if( e.date == date ){
                ret.add(event: e)
            }
        }
        return ret
    }
    
    //
    //*getFrequencyEvent* : ListEventModel x String -> int -- get the frequency of an EventModel
    //
    // - Parameter titleEvent: String to be looked for
    // - Returns: Float with the frequency of the Event
    //
    
    func getFrequencyEvent(forFrequenceEvent titleEvent: String) -> Float{
        return countEvent(forEventModels: titleEvent)/self.levent.count
    }
    
    
    //*countEvent* : ListEvent x String -> int -- occurence of en event in a list of events
    ///  looks for `Event` with same titleEvent and returns the number of Event
    ///
    /// - Parameter titleEvent: String to be looked for
    /// - Returns: integer corresponding to the number of occurence of the string in ListEventModel
    func countEvent(forEventModels titleEvent: String) -> Int{
        var count : Int = 0
        for t in self{
            if( (t.titleEvent == event) ){
                count=+
            }
        }
        return count
    }
    
    
    
    subscript(index: Int) -> EventModel {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            return self.levent[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("index out of range")
            }
            self.levent[index]=newValue
        }
    }
    
    
    /// `ListEventModel` -> `ItListEvent` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func getItEvent() -> ItListEvent{
        return ItListEvent(self)
    }
}


// MARK: -

/// Iterator on ListEventModel
struct ItListEvent : IteratorProtocol{
    private var current: Int = 0
    private let set: ListEventModel
    
    fileprivate init(_ s: ListEventModel){
        self.set = s
    }
    
    /// reset iterator
    ///
    /// - Returns: iterator reseted
    @discardableResult
    mutating func reset() -> ItListEvent{
        self.current = 0
        return self
    }
    
    @discardableResult
    mutating func next() -> EventModel? {
        guard self.current < self.set.count else{
            return nil
        }
        let nextEvent = self.set.levent[self.current]
        self.current += 1
        return nextEvent
    }
    
    /// true if iterator as finished
    var end : Bool{
        return self.current < self.set.count
    }
}





