//
//  AddPillsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddPillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var MedPicker: UIPickerView!
    
    
    @IBOutlet weak var DateTable: UITableView!
    
    @IBOutlet weak var ValidateBTN: UIButton!
    @IBOutlet weak var CancelBTN: UIButton!
    
    var drugIntake: DrugIntakeModel?
    var med: MedModel?
    var dates: [Date] = []
    var dose: String?
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.DateTable.dequeueReusableCell(withIdentifier: "datePillCell", for: indexPath) as! DatePillTableViewCell
        cell.datePillLabel.text = self.dates[indexPath.row].format()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dates.count
    }
    
    func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableView, indexPath: IndexPath){
        if (editingStyle==UITableViewCellEditingStyle.delete){
            self.DateTable.beginUpdates()
            if self.delete(dateWithIndex: indexPath.row){
                self.dateWithIndex.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
            self.DateTable.endUpdates()
        }
    }
    
    func delete(dateWithIndex index: Int) -> Bool{
        guard let context = self.getContext(errorMsg: "Ne peut pas supprimer de date") else {return false}
        let date = self.dates[index]
        context.delete(date)
        do{
            try context.save()
            self.dates.remove(at: index)
            return true
        }
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
