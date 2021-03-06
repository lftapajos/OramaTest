//
//  fundListCell.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class fundListCell: UICollectionViewCell {
    
    // MARK: Declarations
    @IBOutlet weak var simpleName: UILabel!
    @IBOutlet weak var operabilityMinimum: UILabel!
    @IBOutlet weak var fundRisk: UILabel!
    
    func configureCell(_ fund: Fund) {
        simpleName.lineBreakMode = .byWordWrapping
        simpleName.numberOfLines = 0
        
        simpleName.text = fund.simpleName
        operabilityMinimum.text = Fund().formatCurrency(fund.operabilityMinimum)
        fundRisk.text = fund.fundRisk
    }
}
