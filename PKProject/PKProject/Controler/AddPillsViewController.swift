//
//  AddPillsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AddPillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var medPicker: UIPickerView!
    @IBOutlet weak var DateTable: UITableView!
    @IBOutlet weak var ValidateBTN: UIButton!
    @IBOutlet weak var CancelBTN: UIButton!
    
    var drugIntake: DrugIntakeModel?
    var med: Med?
    var dates: [Date] = []
    var dose: String? = nil
    var meds: [Med] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<Med> = Med.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(Med.name), ascending: true)]
        do{
            try self.meds = context.fetch(request)
        }
        catch{
            
        }
        self.med = meds[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Picker View
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return meds[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return meds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        med = meds[row]
    }

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.DateTable.dequeueReusableCell(withIdentifier: "datePillCell", for: indexPath) as! DatePillTableViewCell
        cell.datePillLabel.text = self.dates[indexPath.row].formatHeure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dates.count
    }
    
    func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Button Action
    
    @IBAction func deleteHour(_ sender: Any) {
        if let indexPath = self.DateTable.indexPathForSelectedRow{
            DateTable.beginUpdates()
            DateTable.deleteRows(at: [indexPath], with: .fade)
            self.dates.remove(at: indexPath.row)
            DateTable.endUpdates()
            
        }
    }
    
    @IBAction func validateAction(_ sender: Any) {
        if sender as! UIButton == self.ValidateBTN {
            guard let adoses = dose, let amed = med else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            drugIntake = DrugIntakeModel(med: amed, periodicity: dates, dose: adoses)
            self.performSegue(withIdentifier: "addDrugIntake", sender: self)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Unwind
    
    @IBAction func unwindToAddPills(sender: UIStoryboardSegue){
        if let controller = sender.source as? PopUpPillsDateViewController{
            if let dateToSave = controller.heure{
                self.dates.append(dateToSave)
                self.DateTable.reloadData()
            }
        } else if let controller = sender.source as? selectDoseViewController{
            if let doseToSave = controller.dose{
                self.dose = doseToSave
            }
        }
    }

    // MARK: - Navigation

    let segueAddDose = "addDoseSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueAddDose{
            let medToDose = segue.destination as! selectDoseViewController
            medToDose.med = self.med
            
        }
    }
    
    
    

}
