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
    

    var doses: [String]{
        get{
            return self.dao.doses!
        }
        set{
            self.dao.doses = newValue
        }
    }
    
    
    init(name : String, specification : String, doses: [String]){
        self.dao = Med.create()
        self.dao.name = name
        self.dao.specification = specification
        self.doses = doses
        
    }
    
}
