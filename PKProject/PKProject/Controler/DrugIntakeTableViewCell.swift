//
//  DrugIntakeTableViewCell.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 23/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class DrugIntakeTableViewCell: UITableViewCell {

    @IBOutlet weak var medNameLabel: UILabel!
    @IBOutlet weak var medPeriodicityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
