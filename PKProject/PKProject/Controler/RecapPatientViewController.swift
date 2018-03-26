//
//  RecapPatientViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

class RecapPatientViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var states : [State] = []
    var events : [Event] = []
    var kase : Int = 0
    
    
    @IBOutlet weak var StateTable: UITableView!
    
    @IBAction func windowChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.kase = 0
            StateTable.reloadData()
        case 1:
            self.kase = 1
            StateTable.reloadData()
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
        
        let request : NSFetchRequest<State> = State.fetchRequest()
        let current = (Calendar.current as NSCalendar).date(byAdding: .day, value: -5, to: Date(), options: [])! as NSDate
        request.predicate = NSPredicate(format: "date > %@", current)
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(State.date), ascending: true)]
        do{
            try self.states = context.fetch(request)
        }
        catch {
            fatalError()
        }
        
        
        let request2 : NSFetchRequest<Event> = Event.fetchRequest()
        request2.predicate = NSPredicate(format: "date > %@", current)
        request2.sortDescriptors = [NSSortDescriptor(key: #keyPath(Event.date), ascending: true)]
        do{
            try self.events = context.fetch(request2)
        }
        catch {
            fatalError()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.StateTable.dequeueReusableCell(withIdentifier: "StateCell", for: indexPath) as! StateTableViewCell
        switch self.kase
        {
        case 0:
            let date = self.states[indexPath.row].date as! Date
            cell.StateDateLabel.text = date.format()
            cell.StateTitleLabel.text = self.states[indexPath.row].value
        case 1:
            let date = self.events[indexPath.row].date as! Date
            cell.StateDateLabel.text = date.format()
            cell.StateTitleLabel.text = self.events[indexPath.row].value
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.states.count
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
