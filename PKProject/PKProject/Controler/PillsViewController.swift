//
//  PillsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import Foundation
import UserNotifications

class PillsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UNUserNotificationCenterDelegate{

    @IBOutlet weak var AddBTN: UIButton!
    @IBOutlet weak var DeleteBTN: UIButton!
    
    @IBOutlet weak var PillTable: UITableView!
    var pills: [DrugIntake] = []
    var intake: DrugIntakeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<DrugIntake> = DrugIntake.fetchRequest()
        do{
            try self.pills = context.fetch(request)
        }
        catch {
            //self.alertError(errorMsg: "\(error)", userInfo:"\(error.userInfo)")
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.PillTable.dequeueReusableCell(withIdentifier: "drugCell", for: indexPath) as! DrugIntakeTableViewCell
        cell.medNameLabel.text = self.pills[indexPath.row].med?.name
        var ret = ""
        for var date in self.pills[indexPath.row].periodicity! {
            ret = ret + date.formatHeure() + " "
        }
        cell.medPeriodicityLabel.text = ret
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.pills.count
    }
    
    @IBAction func deleteDrugIntake(_ sender: UIButton) {
        if let indexPath = self.PillTable.indexPathForSelectedRow{
            PillTable.beginUpdates()
            DrugIntake.delete(object: self.pills[indexPath.row])
            DrugIntake.save()
            PillTable.deleteRows(at: [indexPath], with: .fade)
            self.pills.remove(at: indexPath.row)
            PillTable.endUpdates()
            
        }
    }
    
    @IBAction func unwindToPilulier(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddPillsViewController{
            if let drug = controller.drugIntake{
                DrugIntake.save()
                self.PillTable.reloadData()
                let calendar = Calendar.current
                for var date in drug.periodicity {
                    addNotif(heure: calendar.component(.hour, from: date),minute: calendar.component(.minute, from: date), med: drug.med, drug: drug)
                }
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare")
    }
    
    public func addNotif(heure : Int, minute : Int, med: Med, drug: DrugIntakeModel){
        let content = UNMutableNotificationContent()
        content.title = "Prise de " + med.name!
        content.body = "Pensez à prendre votre médicament " + med.name! + " : " + drug.dose
        content.badge = 1
        
        // add notification for Mondays at 11:00 a.m.
        var dateComponents = DateComponents()
        dateComponents.hour = heure
        dateComponents.minute = minute
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request2 = UNNotificationRequest(identifier: "notification1", content: content, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
        print("ok")
    }

}
