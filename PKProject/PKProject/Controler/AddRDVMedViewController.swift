//
//  AddRDVMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class AddRDVMedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var validRDV: UIButton!
    @IBOutlet weak var cancelRDV: UIButton!
    @IBOutlet weak var rdvMedecin: UIPickerView!
    @IBOutlet weak var rdvDate: UIDatePicker!
    @IBOutlet weak var rdvIntitule: UITextField!
    
    var rdv: RDVModel?
    var medecin: DoctorModel?
    var medecins: [Doctor] = []
    var dateRDV : Date?
    var rdvs: [RDV] = []
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        
        
        return medecins[row].name
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return medecins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {

        
        
        medecin = DoctorModel(adress: medecins[row].adress!, name: medecins[row].name!,phoneNumber: medecins[row].phoneNumber!, speciality: medecins[row].speciality! ,travelTime: medecins[row].travelTime)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Doctor> = Doctor.fetchRequest()
        do{
            try self.medecins = context.fetch(request)
        }
        catch{
            
        }

    
    }

    @IBAction func rdvDatePicker(_ sender: UIDatePicker) {
        dateRDV = rdvDate.date
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBAction func actionOnRDV(_ sender: UIButton) {
        if sender == self.validRDV {
            guard let amedecin = medecin else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            
            rdv = RDVModel(date : self.dateRDV! as NSDate, title : self.rdvIntitule.text! , doctor: amedecin)
            self.performSegue(withIdentifier: "addRDV", sender: self)
        } else {
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
