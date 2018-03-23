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
    
    @IBAction func heurePickerAction(_ sender: Any) {
        heure = hourPicker.date
    }
    
    
    
    @IBAction func buttonAction(_ sender: Any) {
        if sender as! UIButton == self.ValidateBTN {
            
        }
        else {
            heure = nil
        }
        self.performSegue(withIdentifier: "toAddPill", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.heure = hourPicker.date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
