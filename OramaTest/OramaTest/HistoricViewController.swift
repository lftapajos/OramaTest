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

        //self.fundItems = Dao().load()
        
        fundTableView.dataSource = self
        fundTableView.delegate = self
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
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: false)
        
        //self.dismiss(animated: true, completion: nil)
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
