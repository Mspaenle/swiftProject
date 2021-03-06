//
//  RDVMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class RDVMedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rdvs : [RDV] = []
    var rdv: RDVModel?

    @IBOutlet weak var rdvTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<RDV> = RDV.fetchRequest()
        do{
            try self.rdvs = context.fetch(request)
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
        let cell = self.rdvTable.dequeueReusableCell(withIdentifier: "RDVCell", for: indexPath) as! RDVTableViewCell
        cell.rdvHeure.text = (self.rdvs[indexPath.row].date! as Date).format()
        cell.rdvIntitule.text = self.rdvs[indexPath.row].title
        cell.rdvMedecin.text = self.rdvs[indexPath.row].doctor?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.rdvs.count
    }
    
    // MARK: - Unwind and Action Button
    
    @IBAction func unwindToViewRDV(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddRDVMedViewController{
            if let newRDV = controller.rdv{
                RDV.save()
                self.rdvs.append(newRDV.dao)
                self.rdvTable.reloadData()
                if newRDV.doctor.speciality == "Neurologue"{
                    addNotifState(date : newRDV.date)
                }
            }
        }
        else if let controller = sender.source as? EditRDVMedViewController{
            if let editedRDV = controller.rdv{
                RDV.save()
                self.rdvs.append(editedRDV.dao)
                self.rdvTable.reloadData()
                if editedRDV.doctor.speciality == "Neurologue"{
                    addNotifState(date : editedRDV.date)
                }
            }
        }
    }
    
    let segueEditRDV = "editRDV"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueEditRDV{
            if let indexPath = self.rdvTable.indexPathForSelectedRow{
                let editRDVController = segue.destination as! EditRDVMedViewController
                editRDVController.rdv2 = self.rdvs[indexPath.row]
                rdvTable.beginUpdates()
                rdvTable.deleteRows(at: [indexPath], with: .fade)
                self.rdvs.remove(at: indexPath.row)
                rdvTable.endUpdates()
            }
        }
    }
    
    @IBAction func deleteRDV(_ sender: UIButton) {
        if let indexPath = self.rdvTable.indexPathForSelectedRow{
            rdvTable.beginUpdates()
            RDV.delete(object: self.rdvs[indexPath.row])
            RDV.save()
            rdvTable.deleteRows(at: [indexPath], with: .fade)
            self.rdvs.remove(at: indexPath.row)
            rdvTable.endUpdates()
            
        }
    }

    
    func addNotifState(date : Date){
        let content = UNMutableNotificationContent()
        content.title = "Etat"
        content.body = "Entrez votre état actuel."
        content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        var dateComponents = DateComponents()
        let calendar = NSCalendar.current
        for day in 1 ... 5 {
            var dayComp = DateComponents()
            dayComp.day = -1*day
            let dateMinus = Calendar.current.date(byAdding: dayComp, to: date)
            let components = calendar.dateComponents([.day, .month, .year], from: dateMinus!)
            dateComponents.day = components.day!
            dateComponents.month = components.month!
            dateComponents.year = components.year!
            for heures in 08 ... 20{
                dateComponents.hour = heures
                dateComponents.minute = 00
                let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                let nom = String(Int(arc4random_uniform(1000000)))
                let request1 = UNNotificationRequest(identifier: nom , content: content, trigger: notificationTrigger)
                // Schedule the request.
                let center = UNUserNotificationCenter.current()
                center.add(request1) { (error : Error?) in
                    if let theError = error {
                        print(theError.localizedDescription)
                    }
                }
            }
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
