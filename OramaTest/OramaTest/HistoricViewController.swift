//
//  HistoricViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class HistoricViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var fundTableView: UITableView!

    let fundItems: Array<Fund> = Dao().load()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.fundItems = Dao().load()
        
        fundTableView.dataSource = self
        fundTableView.delegate = self
    }

    @IBAction func backFundHome(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
