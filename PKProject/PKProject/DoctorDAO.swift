//
//  DoctorDAO.swift
//  PKProject
//
//  Created by Chloe DALGER on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


import Foundation
import CoreData
import UIKit

/// DAO extension
extension Doctor{
    static private func getNewDoctorDTO() -> Doctor{
        return Doctor(context: CoreDataManager.context)
    }
    
    //TODO regarder si clé existe déjà en BD si oui, retourner l'occurrence
    static public func createDTO(adress : String, name : String, phoneNumber: String, speciality: String, travelTime: Int16) -> Doctor{
        let dto = self.getNewDoctorDTO()
        dto.adress = adress
        dto.name   = name
        dto.phoneNumber = phoneNumber
        dto.speciality = speciality
        dto.travelTime = travelTime
        return dto
    }

    static func create() -> Doctor{
        return Doctor(context: CoreDataManager.context)
    }
    
    static func save() {
        do{
            try CoreDataManager.save()
        }catch let error as NSError{
            fatalError("cannot save data: "+error.description)
        }
    }

}
