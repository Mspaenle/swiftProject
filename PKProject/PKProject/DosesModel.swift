//
//  DosesModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


class DosesModel{
    fileprivate var doses : [String] = []

    /// Description
    ///
    /// - Parameter DoctorModel: <#state description#>
    /// - Returns: <#return value description#>
    
    //
    //*add* : Int x unit -> DosesModel -- add a dose in DosesModel
    //
    // - Parameter dose: Dose to be added
    // - Parameter unit: unit corresponding to the dose
    // - Returns: `DosesModel` with new dose added to the set
    //
    @discardableResult
    func add(dose: Int, unit: String) -> DosesModel{
        var doseString = "/(dose)"
        var doz = doseString + " " + unit
        self.doses.append(doz)
        return self
    }
}
  
