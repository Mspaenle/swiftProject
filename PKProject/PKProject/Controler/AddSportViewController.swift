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
    
    // MARK: - Date Picker
    
    @IBAction func rdvDatePicker(_ sender: UIDatePicker) {
        datesport = dateSport.date
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //TODO alerte + vérification d'un nombre si possible
    
    // MARK: - Button Action
    
    @IBAction func actionOnSport(_ sender: UIButton) {
        if sender == self.validSport {
            if self.intituleSport.text != nil && self.descriptionSport.text != nil && self.dureeSport.text != nil  {
                    let a:Int16? = Int16(self.dureeSport.text!)!

                    sport = ActivityModel(date: self.dateSport.date as NSDate, title: self.intituleSport.text!, specification: self.descriptionSport.text!, duration: a!)
                    self.performSegue(withIdentifier: "addSport", sender: self)
            }
            else{
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
