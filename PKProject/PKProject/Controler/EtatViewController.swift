//
//  EtatViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EtatViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var OnBtn: UIButton!
    @IBOutlet weak var OffBtn: UIButton!
    @IBOutlet weak var DyskinesieBtn: UIButton!
    
    var dateState: Date!
    var state: StateModel?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateState = myDatePicker.date

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Action
    
    @IBAction func DatePickerAction(_ sender: Any) {
        dateState = myDatePicker.date
    }
    
    @IBAction func selectStateAction(_ sender: Any) {
        if sender as! UIButton == self.OnBtn {
            state = StateModel(date: dateState,stateValue: StateValue.on)
        } else if sender as! UIButton == self.OffBtn {
            state = StateModel(date: dateState,stateValue: StateValue.off)
        } else {
            state = StateModel(date: dateState,stateValue: StateValue.dys)
        }
        self.performSegue(withIdentifier: "validState", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
