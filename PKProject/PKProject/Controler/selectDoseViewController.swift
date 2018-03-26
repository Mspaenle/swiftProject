//
//  selectDoseViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class selectDoseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var cancelBTN: UIButton!
    @IBOutlet weak var validateBTN: UIButton!
    @IBOutlet weak var dosesPicker: UIPickerView!
    
    var med: Med? = nil
    var dose: String?
    var doses: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let amed = self.med {
            doses = amed.doses!
        }
        self.dose = doses[0]
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Picker View
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return doses[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return doses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        dose = doses[row]
    }
    
    // MARK: - Action Button
    
    @IBAction func buttonAction(_ sender: Any) {
        if sender as! UIButton == self.validateBTN {
            
        }
        else {
            dose = nil
        }
        self.performSegue(withIdentifier: "toAddPill", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
