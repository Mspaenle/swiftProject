//
//  ActivityModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


/**
 ActivityModel type
 
 **title**: ActivityModel -> String
 **duration** : ActivityModel -> Int
 **date** : ActivityModel -> Date
 **description** : ActivityModel -> String
 **periodicity** : ActivityModel -> String
 
 */


class ActivityModel {
    
    
    private var atitle : String
    private var aduration : Int
    private var adate : Date
    private var adescription : String
    private var aperiodicity : String
    
    
    
    /// Description
    ///
    /// - Parameters:
    ///   - atitle: title of the 'ActivityModel'
    ///   - aduration: duration of the 'ActivityModel'
    ///   - adate: date of the 'ActivityModel'
    ///   - adescription: description of the 'ActivityModel'
    ///   - aperiodicity: periodicity of the 'ActivityModel'
    ///
    
    
    var title : String {
        get {
            return self.atitle
        }
        set {
            self.atitle = newValue
        }
    }
    
    var duration : Int {
        get {
            return self.aduration
        }
        set {
            self.aduration = newValue
        }
    }
    
    
    var date : Date {
        get {
            return self.adate
        }
        set {
            self.adate = newValue
        }
    }
    
    
    var description : String {
        get {
            return self.adescription
        }
        set {
            self.adescription = newValue
        }
    }
    
    var periodicity : String {
        get {
            return self.aperiodicity
        }
        set {
            self.aperiodicity = newValue
        }
    }
    
    
    init(title : String, duration : Int, date: Date, description: String, periodicity: String){
        self.atitle = title
        self.aduration = duration
        self.adate = date
        self.adescription = description
        self.aperiodicity = periodicity
        
    }
    
}
