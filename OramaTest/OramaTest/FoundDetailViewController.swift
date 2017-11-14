//
//  FoundDetailViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FoundDetailViewController: UIViewController {

    // MARK: Declarations
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var initialDate: UILabel!
    @IBOutlet weak var strategyVideo: UIImageView!
    @IBOutlet weak var fundManagerDescription: UITextView!
    @IBOutlet weak var activitity: UIActivityIndicatorView!
    
    var index = 0

    //API já carregada, traz os detalhes do Fundo
    let fundItemDetail: Array<FundDetail> = FundDetail().getFundDetail()
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fullName.text = fundItemDetail[index].fullName
        self.initialDate.text = fundItemDetail[index].initialDate
        
        self.activitity.isHidden = true
        
        //Se existir carrega a imagem
        if let stragegyVideo = fundItemDetail[index].strategyVideo {
           
            //Carrega a imagem de thumbnail ,se possuir
            if (stragegyVideo != "") {
                self.activitity.startAnimating()
                Alamofire.request(stragegyVideo).responseImage { response in
                    //debugPrint(response)
                    //debugPrint(response.result)
                    
                    if let image = response.result.value {
                        DispatchQueue.main.async(execute: {
                            self.activitity.stopAnimating()
                            self.strategyVideo.image = image
                        })
                    }
                }
            }
        }
        
        self.fundManagerDescription.text = fundItemDetail[index].fundManagerDescription
        
        //Configure Label
        self.fullName.lineBreakMode = .byWordWrapping
        self.fullName.numberOfLines = 0
    }
    
    //Remove status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Methods
    @IBAction func backFundHome(_ sender: Any) {
        self.view.window!.layer.add(Transitions().transitionFromLeft(), forKey: kCATransition)
        self.dismiss(animated: false)
    }
    
    @IBAction func buyFound(_ sender: Any) {
        let passwordViewController = storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        passwordViewController.index = index

        view.window!.layer.add(Transitions().transitionFromBottom(), forKey: kCATransition)
        self.present(passwordViewController, animated: true, completion: nil)
    }
}
