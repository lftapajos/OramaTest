//
//  PasswordViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    var index = 0
    var fundItems: Array<Fund> = Fund().getHistoric()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Esconde teclado
        self.hideKeyboardWhenTappedAround()
        
        print("Vai comprar fundo \(index)")
    }

    @IBAction func backFundDetail(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmPurchase(_ sender: Any) {
        
        //Efetua a compra
        let fundItem = Fund().getFundItem(position: index)
        buy(fundItem)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PasswordViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PasswordViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension PasswordViewController: BuyPurchaseDelegate {
    
    //let delegate : BuyPurchaseDelegate?
    
    func buy(_ fundItem: Fund) {
        self.fundItems.append(fundItem)
        //Dao().save(fundItem)
        
        Alert(controller: self).show(fundItem, handler : { action in

            //Fecha as telas
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
}
