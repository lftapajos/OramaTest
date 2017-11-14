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
    var fundItems: Array<Fund> = Dao().load()
    let MOCK_PASSWORD = "123456"
    
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
        
        //Testa se a senha foi preenchida corretamente
        let password = passwordTextField!.text
        if(password == nil || password == "" || password != MOCK_PASSWORD) {
            return
        }
        
        //Recupera o fundo para a compra
        let fundItem = Fund().getFundItem(position: index)
        
        //Efetua a compra
        buy(fundItem)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PasswordViewController {

    //Recuo de teclado
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
    
    //Implementa função para comprar um Fundo
    func buy(_ fundItem: Fund) {
        
        //Adiciona o Fundo selecionado na lista de itens
        self.fundItems.append(fundItem)
        
        //Chama função para salvar o novo Fundo no histórico de compas
        Dao().save(fundItems)
        
        //Mostra uma mensagem de confirmação da compra
        Alert(controller: self).show(fundItem, handler : { action in

            //Fecha as telas
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
}
