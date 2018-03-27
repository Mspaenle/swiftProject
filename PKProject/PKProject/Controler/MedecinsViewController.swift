//
//  MedecinsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

class MedecinsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ModifierMedecin: UIButton!
    @IBOutlet weak var medecinTable: UITableView!
    
    var medecins : [Doctor] = []
    var medecin: DoctorModel?

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
            fatalError()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.medecinTable.dequeueReusableCell(withIdentifier: "MedecinCell", for: indexPath) as! MedecinTableViewCell
        cell.MedecinName.text = self.medecins[indexPath.row].name
        cell.MedecinPhone.text = self.medecins[indexPath.row].phoneNumber
        cell.MedecinAdress.text = self.medecins[indexPath.row].adress
        cell.MedecinSpeciality.text = self.medecins[indexPath.row].speciality
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.medecins.count
    }
    
    // MARK: - Unwind
    
    @IBAction func unwindToViewMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddMedecinViewController{
            if let NewMed = controller.medecin{
                Doctor.save()
                self.medecins.append(NewMed.dto)
                self.medecinTable.reloadData()
            }
            
        }
        else if let controller = sender.source as? EditMedecinsViewController{
            if let EditedMed = controller.medecin{
                Doctor.save()
                self.medecins.append(EditedMed.dto)
                self.medecinTable.reloadData()
            }
        }
    }
    
    let segueEditPerson = "editMedecin"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueEditPerson{
            if let indexPath = self.medecinTable.indexPathForSelectedRow{
                let editMedecinController = segue.destination as! EditMedecinsViewController
                editMedecinController.med = self.medecins[indexPath.row]
                medecinTable.beginUpdates()
                medecinTable.deleteRows(at: [indexPath], with: .fade)
                self.medecins.remove(at: indexPath.row)
                medecinTable.endUpdates()
            }
        }
    }

    // MARK: - Button Action
    
    @IBAction func buttonModifMedecin(_ sender: UIButton) {

    }
    
    @IBAction func deleteMedecin(_ sender: UIButton) {
         if let indexPath = self.medecinTable.indexPathForSelectedRow{
            medecinTable.beginUpdates()
            Doctor.delete(object: self.medecins[indexPath.row])
            Doctor.save()
            medecinTable.deleteRows(at: [indexPath], with: .fade)
            self.medecins.remove(at: indexPath.row)
            medecinTable.endUpdates()
        }
    }
    
}
