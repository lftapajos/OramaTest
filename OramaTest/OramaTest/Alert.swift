//
//  Alert.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    // MARK: Declarations
    let controller: UIViewController
    
    // MARK: Constructor
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: Methods
    //Alerta de Erro
    func show(_ title: String = "Sorry", message: String = "Unexpected error.") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    //Alerta de Compra com sucesso
    func show(_ fund: Fund, handler: @escaping (UIAlertAction) -> Void) {
        let details = UIAlertController(title: fund.simpleName, message: "Purchased with success", preferredStyle: UIAlertControllerStyle.alert)
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: handler)
        details.addAction(cancel)
        controller.present(details, animated: true, completion: nil)
    }
}
