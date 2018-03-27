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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Unwind
    
    /// Permit to exit from another view to access this view. Handle this exit.
    ///
    /// - Parameter sender: Most of the time, a IBAction
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

}

