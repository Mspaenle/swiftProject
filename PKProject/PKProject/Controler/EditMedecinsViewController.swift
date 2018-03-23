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
    @IBOutlet weak var EditSpecialityMedecin: UIPickerView!
    @IBOutlet weak var EditTravelMedecin: UITextField!
    @IBOutlet weak var modifMedecin: UIButton!
    @IBOutlet weak var cancelModifMedecin: UIButton!
    
    
    var medecin: DoctorModel?
    var medecins : [Doctor] = []
    var speciality: String?
    
    
    @IBAction func DeleteMedecin(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Doctor> = Doctor.fetchRequest()
        do{
            try self.medecins = context.fetch(request)
        }
        catch {
            //
        }
    }
    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func modifMedecin(_ sender: UIButton) {
        
            if sender == self.modifMedecin {
                let a:Int16? = Int16(self.EditTravelMedecin.text!)!
                medecin = DoctorModel(adress: self.EditAdressMedecin.text!, name: self.EditNameMedecin.text!, phoneNumber: self.EditPhoneMedecin.text!, speciality: self.speciality!, travelTime: a!)
                self.performSegue(withIdentifier: "modifMed", sender: self)
            } else {
                //TODO dismiss
                self.performSegue(withIdentifier: "modifMed", sender: self)
            }
            
        
    }


    @IBAction func unwindToEditMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? MedecinsViewController{
            
            if let _ = controller.medecin{
                var medecin : Doctor
                medecin = controller.medecins[controller.index!]
                self.EditNameMedecin.text = medecin.name
                self.EditAdressMedecin.text = medecin.adress
                self.EditPhoneMedecin.text = medecin.phoneNumber
                self.EditTravelMedecin.text = String(describing: medecin.travelTime)
                speciality=medecin.speciality
                
            }
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
