//
//  EditRDVMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EditRDVMedViewController: UIViewController {

    @IBOutlet weak var editRDVTitle: UITextField!
    @IBOutlet weak var editRDVDate: UIDatePicker!
    @IBOutlet weak var validRDV: UIButton!
    @IBOutlet weak var cancelRDV: UIButton!
    @IBOutlet weak var rdvMedecin: UILabel!
    
    var rdv2 : RDV? = nil
    var rdv: RDVModel?
    var rdvs : [RDV] = []
    var medecin : Doctor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ardv = self.rdv2{
            self.editRDVTitle.text = ardv.title
            self.editRDVDate.date = (ardv.date)! as Date
            medecin = rdv2?.doctor
            self.rdvMedecin.text = ardv.doctor?.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Action
    
    @IBAction func modifRDV(_ sender: UIButton) {
        if sender == self.validRDV {
            RDV.delete(object: rdv2!)
            rdv = RDVModel(date: self.editRDVDate.date as NSDate, title: self.editRDVTitle.text!, doctor: medecin!)
            self.performSegue(withIdentifier: "editRDV", sender: self)
        } else {
            self.dismiss(animated: true, completion: nil)
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
