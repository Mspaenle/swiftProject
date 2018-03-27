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
    
    internal var dto : Doctor
    
    var adress: String {
        get{
            return self.dto.adress!
        }
        set{
            self.dto.adress = newValue
        }
    }
    
    var name: String {
        get{
            return self.dto.name!
        }
        set{
            self.dto.name = newValue
        }
    }
    
    var phoneNumber: String {
        get{
            return self.dto.phoneNumber!
        }
        set{
            self.dto.phoneNumber = newValue
        }
    }
    
    var speciality: String {
        get{
            return self.dto.speciality!
        }
        set{
            self.dto.speciality = newValue
        }
    }
    
    var travelTime: Int16 {
        get{
            return self.dto.travelTime
        }
        set{
            self.dto.travelTime = newValue
        }
    }

    @discardableResult init(adress : String, name : String, phoneNumber: String, speciality: String, travelTime: Int16){
        self.dto = Doctor.createDTO(adress: adress, name: name, phoneNumber: phoneNumber, speciality: speciality, travelTime: travelTime)        
    }

}
