//
//  FoundDetailViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class FoundDetailViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var initialDate: UILabel!
    @IBOutlet weak var strategyVideo: UIImageView!
    @IBOutlet weak var fundManagerDescription: UILabel!

    let fundItemDetail: Array<FundDetail> = FundDetail().getFundDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fullName.text = fundItemDetail[0].fullName
        self.initialDate.text = fundItemDetail[0].initialDate
        
        //Se existir carrega a imagem
        if let stragegyVideo = fundItemDetail[0].strategyVideo {
            self.strategyVideo.image = UIImage(named: stragegyVideo)
        }
        
        self.fundManagerDescription.text = fundItemDetail[0].fundManagerDescription
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
