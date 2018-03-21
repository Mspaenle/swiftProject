//
//  MedecinTableViewCell.swift
//  PKProject
//
//  Created by Chloe DALGER on 21/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class MedecinTableViewCell: UITableViewCell {

    @IBOutlet weak var MedecinName: UILabel!
    @IBOutlet weak var MedecinSpeciality: UILabel!
    @IBOutlet weak var MedecinPhone: UILabel!
    @IBOutlet weak var MedecinAdress: UILabel!
    @IBOutlet weak var MedecinModif: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
