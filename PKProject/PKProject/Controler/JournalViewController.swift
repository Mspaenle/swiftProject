//
//  JournalViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 26/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController {

    @IBOutlet weak var validateBtn: UIButton!
    @IBOutlet weak var nbPrisesRates: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var dateJournal: Date!
    var journal: JournalModel?
    
    @IBAction func DatePickerAction(_ sender: Any) {
        dateJournal = datePicker.date
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateJournal = datePicker.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        if sender as! UIButton == self.validateBtn {
            guard let nb = nbPrisesRates.text else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            journal = JournalModel(number: nb, date: dateJournal)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
        self.performSegue(withIdentifier: "validJournal", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
