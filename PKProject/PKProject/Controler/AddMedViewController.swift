//
//  AddMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddMedViewController: UIViewController {

    @IBOutlet weak var medTitle: UITextField!
    @IBOutlet weak var medDescr: UITextField!
    @IBOutlet weak var validateBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    
    var titleMed: String?
    var descr: String?
    var med: MedModel?
    
    @IBAction func buttonAction(_ sender: Any) {
        if sender as! UIButton == self.validateBTN {
            titleMed = medTitle.text
            descr = medDescr.text
        }
        else {
            self.title = nil
        }
        self.performSegue(withIdentifier: "validEvent", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
