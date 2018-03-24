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

    private var medModel : Med
    
    var med: Med{
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
            return self.dao.dose!
        }
        set{
            self.dao.dose = newValue
        }
    }
    
    
    init(med: Med, periodicity: [Date], dose: String){
        self.dao = DrugIntake.create()
        self.medModel = med
        self.dao.med = med
        self.dao.periodicity = periodicity
        self.dose = dose
        
    }
    
}
