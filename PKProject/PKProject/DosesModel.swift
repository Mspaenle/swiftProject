//
//  DosesModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DosesModel{
    internal var dao : Dose
    
    var title: String {
        get{
            return self.dao.title!
        }
        set{
            self.dao.title = newValue
        }
    }
    
    init(title : String){
        let entity = CoreDataManager.entity(forName: "Dose")
        self.dao = Dose(entity: entity, insertInto: CoreDataManager.context)
        self.dao.title=title
    }
    
}
