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
    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
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
    
    
    private var doctorModel : DoctorModel
    
    var doctor: DoctorModel{
        get{
            return self.doctorModel
        }
        set{
            self.doctorModel = newValue
            self.dao.doctor = doctorModel.dao
        }
    }
    
    
    init(date : NSDate, title : String, doctor: DoctorModel){
        let entity = CoreDataManager.entity(forName: "RDV")
        self.dao = RDV(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date = date
        self.dao.title = title
        self.doctorModel = doctor
        self.dao.doctor = doctor.dao
        
    }   

}
