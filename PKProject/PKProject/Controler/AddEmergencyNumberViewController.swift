//
//  AddEmergencyNumberViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddEmergencyNumberViewController: UIViewController {

    @IBOutlet weak var validateBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var numTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    var emergencyNumber : EmergencyNumberModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonAdd(_ sender: Any) {
        if sender as! UIButton == self.validateBTN {
            let anum = numTF.text
            let atitle = titleTF.text
            guard anum != "" && atitle != "" else {
                let alert = UIAlertController(title: "Entrée incorecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addTextField()
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            emergencyNumber = EmergencyNumberModel(phoneNumber: anum!, title: atitle!)
            self.performSegue(withIdentifier: "addNumber", sender: self)
        }
        else {
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
