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
    let specialities = ["Neurologue","Kinésithérapeuthe","Psychiatre","Généraliste"]
    var speciality: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.speciality = specialities[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Unwind
    
    /// Permit to exit from another view to this one, handle the changes.
    ///
    /// - Parameter sender: IBAction from another view
    @IBAction func unwindToAddMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? MedecinsViewController{
            if let _ = controller.medecin{
                Doctor.save()
            }
        }
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
    ///
    /// - Parameter sender: Button
    @IBAction func buttonMedecin(_ sender: Any) {
        if sender as! UIButton == self.AddMedecin {
            guard PhoneMedecin.text != "" && AdressMedecin.text != "" && TravelMedecin.text != "" && NameMedecin.text != "" , let aspeciality = speciality else {
                let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            guard let a: Int = (self.TravelMedecin.text! as NSString).integerValue, a < 100 else {
                let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir le champs temps de trajet avec un nombre",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            medecin = DoctorModel(adress: self.AdressMedecin.text!, name: self.NameMedecin.text!, phoneNumber: self.PhoneMedecin.text!, speciality: aspeciality, travelTime: Int16(a))
            self.performSegue(withIdentifier: "validMed", sender: self)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
