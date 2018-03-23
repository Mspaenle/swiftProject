//
//  AddPillsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AddPillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var MedPicker: UIPickerView!
    @IBOutlet weak var DateTable: UITableView!
    var dates: [Date] = []
    @IBOutlet weak var ValidateBTN: UIButton!
    @IBOutlet weak var CancelBTN: UIButton!
    
    @IBAction func listDatesAction(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.DateTable.dequeueReusableCell(withIdentifier: "datePillCell", for: indexPath) as! DatePillTableViewCell
        cell.datePillLabel.text = self.dates[indexPath.row].format()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dates.count
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
