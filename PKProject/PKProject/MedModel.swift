//
//  MedModel.swift
//  PKProject
//
//  Created by Chloe DALGER on 05/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation


/**
 MedModel type
 
 **name**: MedModel -> String
 **doses** : MedModel -> DosesModel
 **specifications** : MedModel -> String
 
 */


class MedModel {
    
    
    private var mdname : String
    private var mddoses : DosesModel
    private var mdspecifications : String

    
    
    /// Description
    ///
    /// - Parameters:
    ///   - mdname: name of the 'MedModel'
    ///   - mddoses: doses of the 'MedModel'
    ///   - mdspecifications: specifications of the 'MedModel'
    ///
    
    
    var name : String {
        get {
            return self.mdname
        }
        set {
            self.mdname = newValue
        }
    }
    
    var doses : DosesModel {
        get {
            return self.mddoses
        }
        set {
            self.mddoses = newValue
        }
    }
    
    var specifications : String {
        get {
            return self.mdspecifications
        }
        set {
            self.mdspecifications = newValue
        }
    }

    
    init(name : String, doses : DosesModel, specifications: String){
        self.mdname = name
        self.mddoses = doses
        self.mdspecifications = specifications

    }
    
}
