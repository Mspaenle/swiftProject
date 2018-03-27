//
//  EmergencyNumberTableViewCell.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 27/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class EmergencyNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var intituleLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
