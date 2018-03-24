//
//  SportViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 28/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

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
            //
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.sportTable.dequeueReusableCell(withIdentifier: "SportCell", for: indexPath) as! SportTableViewCell
        cell.descriptionSport.text = self.sports[indexPath.row].specification
        cell.dureeSport.text = String(self.sports[indexPath.row].duration)
        cell.heureSport.text = (self.sports[indexPath.row].date! as Date).format()
        cell.intituleSport.text = self.sports[indexPath.row].title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.sports.count
    }

    
    @IBAction func unwindToViewSport(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddSportViewController{
            
            if let _ = controller.sport{
                
                Activity.save()
                self.sportTable.reloadData() //ne fonctionne pas
                
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
