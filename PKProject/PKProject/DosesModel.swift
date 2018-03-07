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
    //*addDoctor* : ListDoctorModel x DoctorModel -> ListDoctorModel -- add a DoctorModel in ListDoctorModel
    //
    // - Parameter dose: Dose to be added
    // - Parameter unit: unit corresponding to the dose
    // - Returns: `DosesModel` with new dose added to the set
    //

    @discardableResult
    func add(dose: Int, unit: String) -> DosesModel{
        var doseString = String(dose)
        var doz = doseString + " " + unit
        self.doses.append(doz)
        return self
    }
}
  
