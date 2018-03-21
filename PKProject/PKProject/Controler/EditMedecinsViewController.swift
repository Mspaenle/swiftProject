//
//  EditMedecinsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EditMedecinsViewController: UIViewController {

    @IBOutlet weak var EditNameMedecin: UITextField!
    @IBOutlet weak var EditPhoneMedecin: UITextField!
    @IBOutlet weak var EditAdressMedecin: UITextField!
    @IBOutlet weak var EditSpecialityMedecin: UIPickerView!
    @IBOutlet weak var EditTravelMedecin: UITextField!
    
    
    @IBAction func DeleteMedecin(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToEditMedecin(sender: UIStoryboardSegue){
        if let controller = sender.source as? MedecinsViewController{
            if let _ = controller.medecin{
                self.EditNameMedecin.text = controller.medecin?.name
                self.EditAdressMedecin.text = controller.medecin?.adress
                self.EditPhoneMedecin.text = controller.medecin?.phoneNumber
                // TODO picker self.EditSpecialityMedecin. = controller.medecin?.speciality
                self.EditTravelMedecin.text = String(describing: controller.medecin?.travelTime)
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
