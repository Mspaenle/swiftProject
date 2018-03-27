//
//  SportViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class SportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var sports : [Activity] = []
    var sport: ActivityModel?
    
    @IBOutlet weak var sportTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<Activity> = Activity.fetchRequest()
        do{
            try self.sports = context.fetch(request)
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
        let cell = self.sportTable.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath) as! SportTableViewCell
        cell.descriptionSport.text = self.sports[indexPath.row].specification
        cell.dureeSport.text = String(self.sports[indexPath.row].duration)
        cell.heureSport.text = (self.sports[indexPath.row].date! as Date).formatHeure()
        cell.intituleSport.text = self.sports[indexPath.row].title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sports.count
    }

    // MARK: - Action Button
    
    @IBAction func unwindToViewSport(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddSportViewController{
            if let NewSport = controller.sport{
                Activity.save()
                let calendar = Calendar.current
                let dateN = NewSport.dao.date
                addNotif(heure: calendar.component(.hour, from: dateN! as Date),minute: calendar.component(.minute, from: dateN! as Date), sport: NewSport.dao)
                self.sports.append(NewSport.dao)
                self.sportTable.reloadData()
            }
        }
        else if let controller = sender.source as? EditSportViewController{
            if let editedSport = controller.sport{
                Activity.save()
                self.sports.append(editedSport.dao)
                self.sportTable.reloadData()
            }
        }
    }
    
    @IBAction func deleteSport(_ sender: UIButton) {
        if let indexPath = self.sportTable.indexPathForSelectedRow{
            sportTable.beginUpdates()
            Activity.delete(object: self.sports[indexPath.row])
            Activity.save()
            sportTable.deleteRows(at: [indexPath], with: .fade)
            self.sports.remove(at: indexPath.row)
            sportTable.endUpdates()
        }
    }
    
    // MARK: - Navigation
    
    let segueEditSport = "editSport"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueEditSport{
            if let indexPath = self.sportTable.indexPathForSelectedRow{
                let editSportController = segue.destination as! EditSportViewController
                editSportController.sport2 = self.sports[indexPath.row]
                sportTable.beginUpdates()
                sportTable.deleteRows(at: [indexPath], with: .fade)
                self.sports.remove(at: indexPath.row)
                sportTable.endUpdates()
            }
        }
    }

    
    // MARK: - Notifications
    
    public func addNotif(heure : Int, minute : Int, sport: Activity){
        let content = UNMutableNotificationContent()
        content.title = "Sport : " + sport.title!
        content.body = "Il est temps de se bouger et de faire du sport : " + sport.description + " détails : " + String(sport.duration)
        content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
        
        var dateComponents = DateComponents()
        dateComponents.hour = heure
        dateComponents.minute = minute
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request2 = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: notificationTrigger)
        UNUserNotificationCenter.current().add(request2, withCompletionHandler: nil)
    }


}
