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
    var medecin: Doctor?
    var medecins: [Doctor] = []
    var dateRDV : Date?
    var rdvs: [RDV] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateRDV = rdvDate.date
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
            fatalError()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - PickerView
    
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
        medecin = medecins[row]
        
    }
    
    @IBAction func rdvDatePicker(_ sender: UIDatePicker) {
        dateRDV = rdvDate.date
    }

     // MARK: - Action Button
    
    @IBAction func actionOnRDV(_ sender: UIButton) {
        if sender == self.validRDV {
            guard let amedecin = medecin, rdvIntitule.text != "" else {
                let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            rdv = RDVModel(date : self.dateRDV! as NSDate, title : self.rdvIntitule.text! , doctor: amedecin)
            self.performSegue(withIdentifier: "addRDV", sender: self)
            self.dismiss(animated: true, completion: nil)
        } else if sender == self.cancelRDV{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
