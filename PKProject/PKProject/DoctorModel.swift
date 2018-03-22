//
//  DoctorModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DoctorModel{
    internal var dao : Doctor
    
    var adress: String {
        get{
            return self.dao.adress!
        }
        set{
            self.dao.adress = newValue
        }
    }
    
    var name: String {
        get{
            return self.dao.name!
        }
        set{
            self.dao.name = newValue
        }
    }
    
    var phoneNumber: String {
        get{
            return self.dao.phoneNumber!
        }
        set{
            self.dao.phoneNumber = newValue
        }
    }
    
    var speciality: String {
        get{
            return self.dao.speciality!
        }
        set{
            self.dao.speciality = newValue
        }
    }
    
    var travelTime: Int16 {
        get{
            return self.dao.travelTime
        }
        set{
            self.dao.travelTime = newValue
        }
    }
    
    private var rdvModel : RDVModel?
    
    var rdv: RDVModel?{
        get{
            return self.rdvModel
        }
        set{
            self.rdvModel = newValue
            self.dao.rdv = rdvModel?.dao
        }
    }
    
    
    init(adress : String, name : String, phoneNumber: String, speciality: String, travelTime: Int16, rdv: RDVModel?){
        let entity = CoreDataManager.entity(forName: "Doctor")
        self.dao = Doctor(entity: entity, insertInto: CoreDataManager.context)
        self.dao.adress = adress
        self.dao.name = name
        self.dao.phoneNumber = phoneNumber
        self.dao.speciality = speciality
        self.dao.travelTime = travelTime
        self.rdvModel = rdv
        self.dao.rdv = rdv?.dao
        
    }
    

}
