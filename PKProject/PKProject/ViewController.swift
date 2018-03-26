//
//  ViewController.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 20/02/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func unwindToMenu(sender: UIStoryboardSegue){
        if let controller = sender.source as? EtatViewController{
            if let _ = controller.state{
                State.save()
            }
        } else if let controller = sender.source as? EventViewController{
            if controller.eventValue != nil{
                Event.save()
            }
        } else if let controller = sender.source as? JournalViewController{
            if controller.journal != nil{
                Journal.save()
            }
        }
    }
    
    // MARK: - Alerts
    
    func createAlert(title : String, message : String) {
        
    }

}

