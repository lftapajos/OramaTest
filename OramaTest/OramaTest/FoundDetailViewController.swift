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
    
    var index = 0

    let fundItemDetail: Array<FundDetail> = FundDetail().getFundDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fullName.text = fundItemDetail[index].fullName
        self.initialDate.text = fundItemDetail[index].initialDate
        
        //Se existir carrega a imagem
        if let stragegyVideo = fundItemDetail[index].strategyVideo {
            self.strategyVideo.image = UIImage(named: stragegyVideo)
        }
        
        self.fundManagerDescription.text = fundItemDetail[index].fundManagerDescription
    }

    @IBAction func backFundHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
