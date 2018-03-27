//
//  AddSportViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddSportViewController: UIViewController {

    @IBOutlet weak var intituleSport: UITextField!
    @IBOutlet weak var descriptionSport: UITextField!
    @IBOutlet weak var dureeSport: UITextField!
    @IBOutlet weak var dateSport: UIDatePicker!
    @IBOutlet weak var validSport: UIButton!
    @IBOutlet weak var cancelSport: UIButton!
    
    
    var sport: ActivityModel?
    var datesport : Date?
    var sports: [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datesport = Date()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Verification d'un cast de String vers Int
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    // MARK: - Date Picker
    
    @IBAction func rdvDatePicker(_ sender: UIDatePicker) {
        datesport = dateSport.date
    }

    
    
    
    // MARK: - Button Action
    
    @IBAction func actionOnSport(_ sender: UIButton) {
        if sender == self.validSport {
                guard self.intituleSport.text != "" && self.descriptionSport.text != "" && self.dureeSport.text != "" else {
                    let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(cancelAction)
                    present(alert, animated: true)
                    return
                }

            let isint = isStringAnInt(string: self.dureeSport.text!)
            
            guard isint else{
                let alert2 = UIAlertController(title: "Entrée incorrecte", message: "Veuillez mettre un entier dans le champs de duree",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert2.addAction(cancelAction)
                present(alert2, animated: true)
                return
            }
            let a:Int16? = Int16(self.dureeSport.text!)!

                    sport = ActivityModel(date: self.dateSport.date as NSDate, title: self.intituleSport.text!, specification: self.descriptionSport.text!, duration: a!)
                    self.performSegue(withIdentifier: "addSport", sender: self)
             self.dismiss(animated: true, completion: nil)
        }
            
        else {
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
