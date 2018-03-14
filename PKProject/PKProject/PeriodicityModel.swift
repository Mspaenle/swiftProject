//
//  PeriodicityModel.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 14/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PeriodicityModel {
    private var dao : Periodicity
    
    var title: String {
        get{
            return self.dao.title!
        }
        set{
            self.dao.title = newValue
        }
    }
    
    init(title : String){
        let entity = CoreDataManager.entity(forName: "Periodicity")
        self.dao = Periodicity(entity: entity, insertInto: CoreDataManager.context)
        self.dao.title=title
    }
}
