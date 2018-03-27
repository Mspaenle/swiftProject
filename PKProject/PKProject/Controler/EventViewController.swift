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
    var eventValue: String?
    var event: EventModel?
    let events = ["Somnolence","Chute","Hallucination","Prise de dispersible","Clic / bolus d'Apokinon"]
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateEvent = datePicker.date
        self.eventValue = events[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Picker View
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        eventValue = events[row]
    }
    
    // MARK: - Action Button
    
    @IBAction func buttonAction(_ sender: Any) {
        
        if sender as! UIButton == self.validateBTN {
            let val = eventValue
            let ret : EventValue
            if val == "Somnolence" {
                ret = .somnolence
            } else if val == "Chute" {
                ret = .chute
            } else if val == "Hallucination" {
                ret = .hallucination
            } else if val == "Prise de dispersible" {
                ret = .prise
            } else {
                ret = .clic
            }
            event = EventModel(date: dateEvent,eventValue: ret)
            self.performSegue(withIdentifier: "validEvent", sender: self)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
