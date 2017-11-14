//
//  FoundDetailViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class FoundDetailViewController: UIViewController {

    // MARK: Declarations
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var initialDate: UILabel!
    @IBOutlet weak var strategyVideo: UIImageView!
    @IBOutlet weak var fundManagerDescription: UILabel!
    
    var index = 0

    //API já carregada, traz os detalhes do Fundo
    let fundItemDetail: Array<FundDetail> = FundDetail().getFundDetail()
    
    // MARK: View
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Methods
    @IBAction func backFundHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buyFound(_ sender: Any) {
        let passwordViewController = storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        passwordViewController.index = index
        self.present(passwordViewController, animated: true, completion: nil)
    }
}
