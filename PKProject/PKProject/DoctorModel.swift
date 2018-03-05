//
//  DoctorModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

/**
 DoctorModel type
 
 **name**: DoctorModel -> String
 **specialty** : DoctorModel -> String
 **phoneNumber** : DoctorModel -> String
 **adress** : DoctorModel -> String
 **timeTravel** : DoctorModel - > String
 
 */


class EventModel {
    
    
    private var mname : String
    private var mspecialty : String
    private var mphoneNumber : String
    private var madress : String
    private var mtimeTravel : String
    
    
    /// Description
    ///
    /// - Parameters:
    ///   - mname: name of the 'DoctorModel'
    ///   - mspecialty: specialty of the 'DoctorModel'
    ///   - mphoneNumber: phoneNumber of the 'DoctorModel'
    ///   - madress: adress of the 'DoctorModel'
    ///   - mtimeTravel: time to go to the 'DoctorModel'
    ///
    
    
    var name : String {
        get {
            return self.mname
        }
        set {
            self.mname = newValue
        }
    }
    
    var specialty : String {
        get {
            return self.mspecialty
        }
        set {
            self.mspecialty = newValue
        }
    }
    
    var phoneNumber : String {
        get {
            return self.mphoneNumber
        }
        set {
            self.mphoneNumber = newValue
        }
    }
    
    var adress : String {
        get {
            return self.madress
        }
        set {
            self.madress = newValue
        }
    }
    
    var timeTravel : String {
        get {
            return self.mtimeTravel
        }
        set {
            self.mtimeTravel = newValue
        }
    }
    
    init(name : String, specialty : String, phoneNumber: String, adress: String, timeTravel : String){
        self.mname = name
        self.mspecialty = specialty
        self.mphoneNumber = phoneNumber
        self.madress = adress
        self.mtimeTravel = timeTravel
    }
    
}
    

    
