//
//  HistoricListCell.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class HistoricListCell: UITableViewCell {

    // MARK: Declarations
    @IBOutlet weak var simpleName: UILabel!
    @IBOutlet weak var operabilityMinimum: UILabel!
    @IBOutlet weak var fundRisk: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var initialDate: UILabel!
    
    // MARK: View
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ fund: FundDetail, row: Int) {
        simpleName.lineBreakMode = .byWordWrapping
        simpleName.numberOfLines = 0
        
        fullName.lineBreakMode = .byWordWrapping
        fullName.numberOfLines = 0
        
        simpleName.text = fund.fundos[row].simpleName
        operabilityMinimum.text = Fund().formatCurrency(fund.fundos[row].operabilityMinimum)
        fundRisk.text = fund.fundos[row].fundRisk
        fullName.text = fund.fullName
        initialDate.text = fund.initialDate
    }
    // MARK: Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
