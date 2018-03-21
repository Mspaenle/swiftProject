//
//  AddMedecinViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddMedecinViewController: UIViewController {


    @IBOutlet weak var AddMedecin: UIButton!
    @IBOutlet weak var CancelMedecin: UIButton!
    @IBOutlet weak var NameMedecin: UITextField!
    @IBOutlet weak var SpecialtyMedein: UIPickerView!
    @IBOutlet weak var PhoneMedecin: UITextField!
    @IBOutlet weak var AdressMedecin: UITextField!
    @IBOutlet weak var TravelMedecin: UITextField!
    
    var medecin: DoctorModel?
    let specialities = ["Somnolence","Chute","Hallucination","Prise de dispersible","Clic / bolus d'Apokinon"]
    var speciality: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func unwindToAddMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? MedecinsViewController{
            if let _ = controller.medecin{
                Doctor.save()
            }
        }
        
    }
    
    func numberOfComponents(in SpecialtyMedein: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ SpecialtyMedein: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return specialities[row]
    }
    
    func pickerView(_ SpecialtyMedein: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return specialities.count
    }

    func pickerView(_ SpecialtyMedein: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        speciality = specialities[row]
    }
    
    // TODO tests champs non vides + pickerview
    
    @IBAction func buttonMedecin(_ sender: Any) {
        if sender as! UIButton == self.AddMedecin {
            medecin = DoctorModel(adress: self.AdressMedecin.text!, name: self.NameMedecin.text!, phoneNumber: self.PhoneMedecin.text!, speciality: self.speciality!, travelTime: self.TravelMedecin.text as! Int16, rdv: nil)
            self.performSegue(withIdentifier: "addMedecin", sender: self)
        } else {
            //faire cas du nul
            self.performSegue(withIdentifier: "cancelMedecin", sender: self)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
