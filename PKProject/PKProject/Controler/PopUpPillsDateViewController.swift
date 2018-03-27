//
//  PopUpPillsDateViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class PopUpPillsDateViewController: UIViewController {

    @IBOutlet weak var hourPicker: UIDatePicker!
    @IBOutlet weak var CancelBTN: UIButton!
    @IBOutlet weak var ValidateBTN: UIButton!
    
    var heure: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heure = hourPicker.date
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Date Picker
    
    @IBAction func heurePickerAction(_ sender: Any) {
        heure = hourPicker.date
    }
    
    // MARK: - Button Action
    
    @IBAction func buttonAction(_ sender: Any) {
        if sender as! UIButton == self.ValidateBTN {
            self.performSegue(withIdentifier: "toAddPill", sender: self)
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
