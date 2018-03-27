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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the doctor given by the previous view and init the components
        if let amedecin = self.med{
            self.EditNameMedecin.text = amedecin.name
            self.EditAdressMedecin.text = amedecin.adress
            self.EditPhoneMedecin.text = amedecin.phoneNumber
            self.EditTravelMedecin.text = String(describing: amedecin.travelTime)
            speciality = amedecin.speciality
            self.specialityMedecin.text = amedecin.speciality
        }
    }
    
    //Check if the String is an Int
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Action Button and Navigation
    
    /// Execute the modification of the doctor if the sender is modifMedecin (the edit button), else it send back to the previous view.
    /// Check if the textfields are not empty and if the duration is a number, if not, send an alert
    ///
    /// - Parameter sender: UIButton
    @IBAction func modifMedecin(_ sender: UIButton) {
            if sender == self.modifMedecin {
                
                guard self.EditNameMedecin.text != "" && self.EditPhoneMedecin.text != "" && self.EditAdressMedecin.text != "" && self.EditTravelMedecin.text != "" else {
                    let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(cancelAction)
                    present(alert, animated: true)
                    return
                }
                
                let isint = isStringAnInt(string: self.EditTravelMedecin.text!)
                
                guard isint else{
                    let alert2 = UIAlertController(title: "Entrée incorrecte", message: "Veuillez mettre un entier dans le champs de duree",preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .default)
                    alert2.addAction(cancelAction)
                    present(alert2, animated: true)
                    return
                }
                
                Doctor.delete(object: med!)
                
                let a:Int16? = Int16(self.EditTravelMedecin.text!)!
                
                medecin = DoctorModel(adress: self.EditAdressMedecin.text!, name: self.EditNameMedecin.text!, phoneNumber: self.EditPhoneMedecin.text!, speciality: self.speciality!, travelTime: a!)
                self.performSegue(withIdentifier: "editMedecin", sender: self)
            } else if sender == self.cancelModifMedecin{
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
