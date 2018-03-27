//
//  AddMedecinViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData


class AddMedecinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var AddMedecin: UIButton!
    @IBOutlet weak var CancelMedecin: UIButton!
    @IBOutlet weak var NameMedecin: UITextField!
    @IBOutlet weak var SpecialtyMedein: UIPickerView!
    @IBOutlet weak var PhoneMedecin: UITextField!
    @IBOutlet weak var AdressMedecin: UITextField!
    @IBOutlet weak var TravelMedecin: UITextField!
    
    var medecin: DoctorModel?
    let specialities = ["Diététicien(ne)", "Ergothérapeuthe", "Généraliste", "Infirmier", "Kinésithérapeuthe", "Neurologue", "Neuropsychologue", "Orthophoniste", "Orthoptiste", "Pédicure-Podologue",  "Psychologue Clinicien", "Psychomotricien", "Autres"]
    var speciality: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let spe : String? = specialities[0] else{
            fatalError()
        }
        self.speciality = spe
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Check if the String is an Int
    ///
    /// - Parameter string: string to check
    /// - Returns: return a boolean, true if the string is a integer, false if not
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    
    
    
    // MARK: - PickerView
    
    func numberOfComponents(in SpecialtyMedein: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return specialities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return specialities.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        speciality = specialities[row]
    }
    
    // MARK: - Action Button and Navigation
    
    /// Handle Action on buttons from the view. Send a new doctor if "validate", just dismiss the view if not.
    /// Check if the textfields are not empty and if the duration is a number, if not, send an alert
    ///
    /// - Parameter sender: UIButton
    @IBAction func buttonMedecin(_ sender: Any) {
        if sender as! UIButton == self.AddMedecin {
            guard PhoneMedecin.text != "" && AdressMedecin.text != "" && TravelMedecin.text != "" && NameMedecin.text != "" , let aspeciality = speciality else {
                let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            let isint = isStringAnInt(string: self.TravelMedecin.text!)
            
            guard isint else{
                let alert2 = UIAlertController(title: "Entrée incorrecte", message: "Veuillez mettre un entier dans le champs de duree",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert2.addAction(cancelAction)
                present(alert2, animated: true)
                return
            }
            
            let a:Int16? = Int16(self.TravelMedecin.text!)!
            
            medecin = DoctorModel(adress: self.AdressMedecin.text!, name: self.NameMedecin.text!, phoneNumber: self.PhoneMedecin.text!, speciality: aspeciality, travelTime: a!)
            self.performSegue(withIdentifier: "validMed", sender: self)
        } else if sender as! UIButton == self.CancelMedecin{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
