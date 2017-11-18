//
//  PasswordViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    // MARK: Declarations
    @IBOutlet weak var passwordTextField: UITextField!
    
    var index = 0
    var fundItems: Array<FundDetail> = Dao().load()
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

        //Configura teclado
        self.hideKeyboardWhenTappedAround()
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
    @IBAction func backFundDetail(_ sender: Any) {
        self.view.window!.layer.add(Transitions().transitionFromTop(), forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmPurchase(_ sender: Any) {
        
        //Testa se a senha foi preenchida corretamente
        let password = passwordTextField!.text
        if(password == nil || password == "" || password != MOCK_PASSWORD) {
            return
        }
        
        //Recupera o fundo para a compra
        let fundItem = FundDetail().getFundDetail()
        
        //Efetua a compra
        buy(fundItem[index])
    }
}

// MARK: Keyboard
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

// MARK: Purchase Delegate
extension PasswordViewController: BuyPurchaseDelegate {
    
    //Implementa função para comprar um Fundo
    func buy(_ fundItem: FundDetail) {
        
        //Adiciona o Fundo selecionado na lista de itens
        self.fundItems.append(fundItem)
        
        //Chama função para salvar o novo Fundo no histórico de compas
        Dao().save(fundItems)
        
        //Mostra uma mensagem de confirmação da compra
        Alert(controller: self).show(fundItem, index: index, handler : { action in

            //Fecha as telas
            self.view.window!.layer.add(Transitions().transitionFromTop(), forKey: kCATransition)
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
}
