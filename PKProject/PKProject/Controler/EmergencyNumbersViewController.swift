//
//  EmergencyNumbersViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class EmergencyNumbersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var NumberTable: UITableView!
    @IBOutlet weak var DeleteBTN: UIButton!
    @IBOutlet weak var AddBTN: UIButton!
    
    var nums: [EmergencyNumber] = []
    var numero: EmergencyNumberModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<EmergencyNumber> = EmergencyNumber.fetchRequest()
        do{
            try self.nums = context.fetch(request)
        }
        catch {
            fatalError()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.NumberTable.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as! EmergencyNumberTableViewCell
        cell.intituleLabel.text = self.nums[indexPath.row].title
        cell.numLabel.text = self.nums[indexPath.row].phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.nums.count
    }
    
    // MARK: - Button Action
    
    @IBAction func deleteAction(_ sender: Any) {
        if let indexPath = self.NumberTable.indexPathForSelectedRow{
            NumberTable.beginUpdates()
            EmergencyNumber.delete(object: self.nums[indexPath.row])
            EmergencyNumber.save()
            NumberTable.deleteRows(at: [indexPath], with: .fade)
            self.nums.remove(at: indexPath.row)
            NumberTable.endUpdates()
            
        }
    }

    
    // MARK: - Navigation

    @IBAction func unwindToNumbers(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddEmergencyNumberViewController{
            if let newNumber = controller.emergencyNumber{
                EmergencyNumber.save()
                self.nums.append(newNumber.dao)
                self.NumberTable.reloadData()
            }
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
