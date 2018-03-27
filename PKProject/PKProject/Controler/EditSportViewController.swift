//
//  EditSportViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EditSportViewController: UIViewController {

    @IBOutlet weak var titleEditSport: UITextField!
    @IBOutlet weak var descriptionEditSport: UITextField!
    @IBOutlet weak var dureeEditSport: UITextField!
    @IBOutlet weak var dateEditSport: UIDatePicker!
    @IBOutlet weak var validSport: UIButton!
    @IBOutlet weak var cancelSport: UIButton!
    
    var sport2 : Activity? = nil
    var sport: ActivityModel?
    var sports : [Activity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let asport = self.sport2{
            self.titleEditSport.text = asport.title
            self.dateEditSport.date = (asport.date)! as Date
            self.dureeEditSport.text = String(asport.duration)
            self.descriptionEditSport.text = asport.specification
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Verification d'un cast de String vers Int
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    // MARK: - Button Action
    
    @IBAction func modifSport(_ sender: UIButton) {
        if sender == self.validSport {
            guard self.titleEditSport.text != "" && self.descriptionEditSport.text != "" && self.dureeEditSport.text != "" else {
                    let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(cancelAction)
                    present(alert, animated: true)
                    return
            }
            
            let isint = isStringAnInt(string: self.dureeEditSport.text!)
            
            guard isint else{
                let alert2 = UIAlertController(title: "Entrée incorrecte", message: "Veuillez mettre un entier dans le champs de duree",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert2.addAction(cancelAction)
                present(alert2, animated: true)
                return
            }
            
            Activity.delete(object: sport2!)
            let a:Int16? = Int16(self.dureeEditSport.text!)!
            
            sport = ActivityModel(date: self.dateEditSport.date as NSDate, title: self.titleEditSport.text!, specification: self.descriptionEditSport.text!, duration: a!)
            self.performSegue(withIdentifier: "editSport", sender: self)
        }
        else if sender == self.cancelSport{
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
