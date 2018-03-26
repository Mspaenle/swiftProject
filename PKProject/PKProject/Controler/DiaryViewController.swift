//
//  DiaryViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class DiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var TableAgenda: UITableView!
    
    var rdvs : [RDV] = []
    var activities : [Activity] = []
    var kase : Int = 0
    
    @IBAction func windowChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.kase = 0
            TableAgenda.reloadData()
        case 1:
            self.kase = 1
            TableAgenda.reloadData()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            //self.alertError(errorMsg: "Could not load data", userInfo: "reason unknown")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let request : NSFetchRequest<RDV> = RDV.fetchRequest()
        let current = NSDate()
        request.predicate = NSPredicate(format: "date > %@", current)
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(RDV.date), ascending: true)]
        do{
            try self.rdvs = context.fetch(request)
        }
        catch {
            fatalError()
        }
        let request2 : NSFetchRequest<Activity> = Activity.fetchRequest()
        request2.predicate = NSPredicate(format: "date > %@", current)
        request2.sortDescriptors = [NSSortDescriptor(key: #keyPath(Activity.date), ascending: true)]
        do{
            try self.activities = context.fetch(request2)
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
        let cell = self.TableAgenda.dequeueReusableCell(withIdentifier: "AgendaCell", for: indexPath) as! AgendaTableViewCell
        switch self.kase
        {
        case 0:
            let date = self.rdvs[indexPath.row].date! as Date
            cell.dateAgendaLabel.text = date.format()
            cell.titleAgendaLabel.text = self.rdvs[indexPath.row].title
            cell.medAgendaLabel.text = self.rdvs[indexPath.row].doctor?.name
        case 1:
            let date = self.activities[indexPath.row].date! as Date
            cell.dateAgendaLabel.text = date.format()
            cell.titleAgendaLabel.text = self.activities[indexPath.row].title
            cell.medAgendaLabel.text = ""
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if kase == 0 {
            return self.rdvs.count
        } else if kase == 1 {
            return self.activities.count
        } else {return 0}
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
