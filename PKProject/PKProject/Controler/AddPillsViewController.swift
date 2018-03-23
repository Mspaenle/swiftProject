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
    var med: MedModel?
    var dates: [Date] = []
    var dose: String?
    var meds: [Med] = []
    
   
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
        med = MedModel(name: meds[row].name!,specification: meds[row].specification!,doses: meds[row].doses!)
    }
    
    @IBAction func listDatesAction(_ sender: Any) {

    }
    
    @IBAction func validateAction(_ sender: Any) {
        if sender as! UIButton == self.ValidateBTN {
            drugIntake = DrugIntakeModel(med: med!, periodicity: dates, dose: dose!)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Med> = Med.fetchRequest()
        do{
            try self.meds = context.fetch(request)
        }
        catch{
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    @IBAction func unwindToAddPills(sender: UIStoryboardSegue){
        if let controller = sender.source as? PopUpPillsDateViewController{
            if let dateToSave = controller.heure{
                self.dates.append(dateToSave)
                self.DateTable.reloadData()
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
