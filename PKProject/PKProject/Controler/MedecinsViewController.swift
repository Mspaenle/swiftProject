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
    
    var medecin: DoctorModel?
    var index : Int?
    
    @IBOutlet weak var medecinTable: UITableView!
    
    var medecins : [Doctor] = []

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.medecinTable.dequeueReusableCell(withIdentifier: "MedecinCell", for: indexPath) as! MedecinTableViewCell
        cell.MedecinName.text = self.medecins[indexPath.row].name
        cell.MedecinPhone.text = self.medecins[indexPath.row].phoneNumber
        cell.MedecinAdress.text = self.medecins[indexPath.row].adress
        cell.MedecinSpeciality.text = self.medecins[indexPath.row].speciality
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.medecins.count
    }
    
    @IBAction func unwindToViewMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddMedecinViewController{
            if let _ = controller.medecin{
                if controller.medecin?.phoneNumber != nil {
                    Doctor.save()
                    self.medecinTable.reloadData() //ne fonctionne pas
                }
            }
        }
        if let controller = sender.source as? EditMedecinsViewController{
            if let _ = controller.medecin{
                if controller.medecin?.phoneNumber != nil{
                    Doctor.save()
                    self.medecinTable.reloadData() //ne fonctionne pas
                }
            }
        }
        
        
    }
    

    @IBAction func buttonModifMedecin(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "modifMed", sender: self)
        

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
