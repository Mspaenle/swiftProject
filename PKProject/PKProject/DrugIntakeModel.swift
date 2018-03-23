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

    private var medModel : MedModel
    
    var med: MedModel{
        get{
            return self.medModel
        }
    }
    
    var periodicity: [Date]{
        get{
            return self.dao.periodicity!
        }
        set{
            self.dao.periodicity = newValue
        }
    }
    
    var dose: String{
        get{
            return self.dose
        }
        set{
            self.dose = newValue
        }
    }
    
    
    init(med: MedModel, periodicity: [Date], dose: String){
        self.dao = DrugIntake.create()
        self.medModel = med
        self.dao.med = med.dao
        self.dao.periodicity = periodicity
        self.dose = dose
        
    }
}
