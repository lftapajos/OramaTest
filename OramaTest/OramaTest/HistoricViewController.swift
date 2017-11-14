//
//  HistoricViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class HistoricViewController: UIViewController {

    // MARK: Declaratins
    @IBOutlet weak var fundTableView: UITableView!

    let fundItems: Array<Fund> = Dao().load()
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

        fundTableView.dataSource = self
        fundTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Verifica se existem Fundos salvos no Histórico de compras
        if (self.fundItems.count == 0) {
            
            //Mostra alerta se não possuirem dados no Histórico de compras
            Alert(controller: self).showError(message: "No data saved", handler : { action in
                
                //Retorna automaticamente para a lista de Fundos
                self.view.window!.layer.add(Transitions().transitionFromLeft(), forKey: kCATransition)
                self.dismiss(animated: false)
            })
        }
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
}

// MARK: TableView Delegate
extension HistoricViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fundItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fundTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! HistoricListCell
        
        let row = indexPath.row
        let fund = fundItems[row]
        cell.simpleName.text = fund.simpleName
        cell.operabilityMinimum.text = Fund().formatCurrency(fund.operabilityMinimum)
        cell.fundRisk.text = fund.fundRisk
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
