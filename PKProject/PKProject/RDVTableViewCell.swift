//
//  RDVTableViewCell.swift
//  PKProject
//
//  Created by Chloe DALGER on 24/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class RDVTableViewCell: UITableViewCell {

    @IBOutlet weak var rdvHeure: UILabel!
    @IBOutlet weak var rdvMedecin: UILabel!
    @IBOutlet weak var rdvIntitule: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
