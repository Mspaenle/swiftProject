//
//  DrugIntakeModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class DrugIntakeModel{
    internal var dao : DrugIntake
    
    var date: NSDate {
        get{
            return self.dao.date!
        }
        set{
            self.dao.date = newValue
        }
    }
    
    
    private var medModel : MedModel
    
    var med: MedModel{
        get{
            return self.medModel
        }
        set{
            self.medModel = newValue
            self.dao.med = medModel.dao
        }
    }
    
    private var periodicityModel : PeriodicityModel
    
    var periodicity: PeriodicityModel{
        get{
            return self.periodicityModel
        }
        set{
            self.periodicityModel = newValue
            self.dao.periodicity = periodicityModel.dao
        }
    }
    
    private var dosesModel : DosesModel
    
    var dose: DosesModel{
        get{
            return self.dosesModel
        }
        set{
            self.dosesModel = newValue
            self.dao.dose = dosesModel.dao
        }
    }
    
    
    init(date : NSDate, med: MedModel, periodicity: PeriodicityModel, doses: DosesModel){
        let entity = CoreDataManager.entity(forName: "DrugIntake")
        self.dao = DrugIntake(entity: entity, insertInto: CoreDataManager.context)
        self.dao.date = date
        self.medModel = med
        self.dao.med = med.dao
        self.periodicityModel = periodicity
        self.dao.periodicity = periodicity.dao
        self.dosesModel = doses
        self.dao.dose = doses.dao
        
    }
}
