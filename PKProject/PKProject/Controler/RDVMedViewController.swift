//
//  RDVMedViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

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
            //
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.rdvTable.dequeueReusableCell(withIdentifier: "RDVCell", for: indexPath) as! RDVTableViewCell
        let heure = self.rdvs[indexPath.row].date! as Date
        cell.rdvHeure.text = heure.format()
        cell.rdvIntitule.text = self.rdvs[indexPath.row].title
        cell.rdvMedecin.text = self.rdvs[indexPath.row].doctor?.name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.rdvs.count
    }
    
    @IBAction func unwindToViewRDV(sender: UIStoryboardSegue){
        if let controller = sender.source as? AddRDVMedViewController{
            
            if let _ = controller.rdv{
                
                RDV.save()
                self.rdvTable.reloadData() //ne fonctionne pas
                
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
