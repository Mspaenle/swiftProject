//
//  MedModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class MedModel{
    internal var dao : Med
    
    var name: String {
        get{
            return self.dao.name!
        }
        set{
            self.dao.name = newValue
        }
    }
    
    var specification: String {
        get{
            return self.dao.name!
        }
        set{
            self.dao.name = newValue
        }
    }
    
    
    private var dosesModel : DosesModel
    
    var doses: DosesModel{
        get{
            return self.dosesModel
        }
        set{
            self.dosesModel = newValue
            self.dao.doses = dosesModel.dao
        }
    }
    
    
    init(name : String, specification : String, doses: DosesModel){
        let entity = CoreDataManager.entity(forName: "Med")
        self.dao = Med(entity: entity, insertInto: CoreDataManager.context)
        self.dao.name = name
        self.dao.specification = specification
        self.dosesModel = doses
        self.dao.doses = doses.dao
        
    }
}
