//
//  StateTableViewCell.swift
//  PKProject
//
//  Created by Mahe SPAENLE on 12/03/2018.
//  Copyright © 2018 Mahe SPAENLE Chloé DALGER. All rights reserved.
//

import Foundation
import UIKit

class StateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var StateDateLabel: UILabel!
    @IBOutlet weak var StateTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
