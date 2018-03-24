//
//  EditMedecinsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

class EditMedecinsViewController: UIViewController {

    @IBOutlet weak var EditNameMedecin: UITextField!
    @IBOutlet weak var EditPhoneMedecin: UITextField!
    @IBOutlet weak var EditAdressMedecin: UITextField!
    @IBOutlet weak var EditTravelMedecin: UITextField!
    @IBOutlet weak var modifMedecin: UIButton!
    @IBOutlet weak var cancelModifMedecin: UIButton!
    @IBOutlet weak var specialityMedecin: UILabel!
    
    var medecin: DoctorModel?
    var medecins : [Doctor] = []
    var speciality: String?
    var med : Doctor? = nil
    
    
    @IBAction func DeleteMedecin(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let amedecin = self.med{
            self.EditNameMedecin.text = amedecin.name
            self.EditAdressMedecin.text = amedecin.adress
            self.EditPhoneMedecin.text = amedecin.phoneNumber
            self.EditTravelMedecin.text = String(describing: amedecin.travelTime)
            speciality = amedecin.speciality
            self.specialityMedecin.text = amedecin.speciality
            
            
        }
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //TODO vérifier les types des données et données vides
    @IBAction func modifMedecin(_ sender: UIButton) {
        
            if sender == self.modifMedecin {

                Doctor.delete(object: med!)
                let a:Int16? = Int16(self.EditTravelMedecin.text!)!
                
                medecin = DoctorModel(adress: self.EditAdressMedecin.text!, name: self.EditNameMedecin.text!, phoneNumber: self.EditPhoneMedecin.text!, speciality: self.speciality!, travelTime: a!)
 
                self.performSegue(withIdentifier: "editMedecin", sender: self)
            } else {
                //TODO dismiss
                self.dismiss(animated: true, completion: nil)
            }
            
        
    }



    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
