//
//  EventViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var eventPicker: UIPickerView!
    @IBOutlet weak var validateBTN: UIButton!
    @IBOutlet weak var cancelBTN: UIButton!
    
    var dateEvent: Date!
    var event: EventModel?
    let events = ["Somnolence","Chute","Hallucination","Prise de dispersible","Clic / bolus d'Apokinon"]
    
    @IBAction func DatePickerAction(_ sender: Any) {
        dateEvent = datePicker.date
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return events[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return events.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateEvent = datePicker.date
        
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
