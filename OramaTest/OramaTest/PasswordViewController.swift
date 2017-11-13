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
        //self.dismiss(animated: true, completion: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
