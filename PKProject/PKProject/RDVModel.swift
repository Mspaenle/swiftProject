//
//  RDVModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RDVModel{
    internal var dao : RDV
    
    var date: Date {
        get{
            return self.dao.date! as Date
        }
        set{
            self.dao.date = newValue as NSDate
        }
    }
    
    var title: String {
        get{
            return self.dao.title!
        }
        set{
            self.dao.title = newValue
        }
    }
    
    
    private var doctorModel : Doctor
    
    var doctor: Doctor{
        get{
            return self.doctorModel
        }
    }
    
    
    
    
    init(date : NSDate, title : String, doctor: Doctor){
        self.dao = RDV.create()
        self.dao.date = date
        self.dao.title = title
        self.doctorModel = doctor
        self.dao.doctor = doctor
        //self.doctorModel.addRdv(rdv: self)
    }   

}
