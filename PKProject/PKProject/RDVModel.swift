//
//  RDVModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation

/**
 RDVModel type
 
 **title**: RDVModel -> String
 **doctor** : RDVModel -> DoctorModel
 **date** : RDVModel -> Date
 
 */


class RDVModel {
    
    
    private var rtitle : String
    let doctor : Doctor
    private var rdate : Date
    
    
    
    /// Description
    ///
    /// - Parameters:
    ///   - rtitle: title of the 'RDVModel'
    ///   - doctor: doctor of the 'RDVModel'
    ///   - rdate: date of the 'RDVModel'
    ///
    
    
    var title : String {
        get {
            return self.rtitle
        }
        set {
            self.rtitle = newValue
        }
    }
    
    
    var date : Date {
        get {
            return self.rdate
        }
        set {
            self.rdate = newValue
        }
    }
    
    
    
    init(title : String, doctor : Doctor, date : Date){
        self.rtitle = title
        self.doctor = doctor
        self.rdate = date
        
    }
    
}
