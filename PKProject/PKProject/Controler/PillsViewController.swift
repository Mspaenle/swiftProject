//
//  PillsViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit
import CoreData

class PillsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var EditBTN: UIButton!
    @IBOutlet weak var AddBTN: UIButton!
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.PillTable.dequeueReusableCell(withIdentifier: "drugCell", for: indexPath) as! MedTableViewCell
        cell.medNameLabel.text = self.pills[indexPath.row].med?.name
        cell.medDescrLabel.text = String(describing: self.pills[indexPath.row].periodicity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.pills.count
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare")
    }
    

}
