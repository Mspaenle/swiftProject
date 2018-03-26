//
//  AgendaTableViewCell.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 26/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var dateAgendaLabel: UILabel!
    @IBOutlet weak var titleAgendaLabel: UILabel!
    @IBOutlet weak var medAgendaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
