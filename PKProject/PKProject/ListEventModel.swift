//
//  ListEventModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit
import CoreData

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

class ListEvent : Sequence {
    fileprivate var levent : [Event] = []
    
    /// Description
    ///
    /// - Parameter EventModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*addEvent* : ListEvent x Event -> ListEvent -- add an Event in ListEvent
    //
    // - Parameter event: `Event` to be added
    // - Returns: `ListEvent` with new `Event` added to the set
    //
    
    @discardableResult
    func add(event: Event) -> ListEvent{
        self.levent.append(event)
        return self
    }
    
    //
    //*getEvent* : ListEvent x Date -> ListEvent -- get Event since a date
    //
    // - Parameter date: Date to be looked for
    // - Returns: ListEvent will all `Event` conforming to parameter
    //
    
    func getEvent(forEventDate date: NSDate) -> ListEvent{
        let ret : ListEvent = ListEvent()
        for e in self{
            if( e.date <= date ){
                ret.add(event: e)
            }
        }
        return ret
    }
    
    //
    //*getDateEvent* : ListEvent x Date -> ListEvent -- get a ListEvent according to a date
    //
    // - Parameter date: Date to be looked for
    // - Returns: ListEvent will all `Event` conforming to parameter
    //
    
    func getDateEvent(forEventDate date: NSDate) -> ListEvent{
        let ret : ListEvent = ListEvent()
        for e in self{
            if( e.date == date ){
                ret.add(event: e)
            }
        }
        return ret
    }
    
    //
    //*getFrequencyEvent* : ListEvent x String -> int -- get the frequency of an Event
    //
    // - Parameter titleEvent: String to be looked for
    // - Returns: Float with the frequency of the Event
    //
    
    func getFrequencyEvent(forFrequenceEvent titleEvent: Int) -> Int{
        return countEvent(forEvents: titleEvent)/self.levent.count
    }
    
    
    //*countEvent* : ListEvent x String -> int -- occurence of en event in a list of events
    ///  looks for `Event` with same titleEvent and returns the number of Event
    ///
    /// - Parameter titleEvent: String to be looked for
    /// - Returns: integer corresponding to the number of occurence of the string in ListEventModel
    func countEvent(forEvents titleEvent: Int) -> Int{
        var count : Int = 0
        for t in self{
            if( (t.titleEvent == titleEvent) ){
                count+=1
            }
        }
        return count
    }
    
    /// number of elements in the set
    var count: Int{
        return self.levent.count
    }
    
    
    subscript(index: Int) -> Event
 {
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
    
    
    /// `ListEvent` -> `ItListEvent` -- make an iterator on the set
    ///
    /// - Returns: a new iterator on the set initialized on the first element
    func makeIterator() -> ItListEvent{
        return ItListEvent(self)
    }
}


// MARK: -

/// Iterator on ListEvent
struct ItListEvent : IteratorProtocol{
    private var current: Int = 0
    private let set: ListEvent
    
    fileprivate init(_ s: ListEvent){
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
    mutating func next() -> Event? {
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





