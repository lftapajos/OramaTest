//
//  HistoricListCell.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class HistoricListCell: UITableViewCell {

    @IBOutlet weak var simpleName: UILabel!
    @IBOutlet weak var operabilityMinimum: UILabel!
    @IBOutlet weak var fundRisk: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
