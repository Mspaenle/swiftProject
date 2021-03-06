//
//  AddMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddMedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var DosesTable: UITableView!
    
    @IBOutlet weak var medTitle: UITextField!
    @IBOutlet weak var medDescr: UITextField!
    @IBOutlet weak var validateBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    
    var titleF: String?
    var med: MedModel?
    var doses: [String] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Button Action
    
    @IBAction func addDoseAction(_ sender: Any) {
        let alert = UIAlertController(title: "Nouvelle Dose", message: "Ajouter une dose (ex: 250mg)",preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Ajouter", style: .default)
        {
            [unowned self] action in
            guard let textField = alert.textFields?.first, let doseToSave = textField.text else {
                return
            }
            self.doses.append(doseToSave)
            self.DosesTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Annuler", style: .default)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if sender as! UIButton == self.validateBTN {
            guard medTitle.text != "" && doses.count != 0 else {
                let alert = UIAlertController(title: "Entrée incorrecte", message: "Veillez à remplir tous les champs",preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(cancelAction)
                present(alert, animated: true)
                return
            }
            med = MedModel(name: medTitle.text!, specification: medDescr.text!, doses: self.doses)
            self.performSegue(withIdentifier: "validMed", sender: self)
        } else if sender as! UIButton == self.cancelBTN {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.DosesTable.dequeueReusableCell(withIdentifier: "DoseCell", for: indexPath) as! DoseTableViewCell
        cell.DoseTextLabel.text = self.doses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.doses.count
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
