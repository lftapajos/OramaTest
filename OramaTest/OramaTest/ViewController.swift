//
//  ViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 10/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    //var storyboard = UIStoryboard(name: "Main", bundle: nil)
    let fundItems: Array<Fund> = Fund().getFunds()
    
    @IBOutlet weak var viewHistory: UIView!
    @IBOutlet weak var fundCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        fundCollectionView.dataSource = self
        fundCollectionView.delegate = self
        
        self.viewHistory.layer.cornerRadius = 10
    }

    @IBAction func showHistoric(_ sender: Any) {
        let historicViewController = storyboard?.instantiateViewController(withIdentifier: "HistoricViewController") as! HistoricViewController
        self.present(historicViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fundItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! fundListCell

        let row = indexPath.row
        let fund = fundItems[row]
        cell.simpleName.text = fund.simpleName
        cell.operabilityMinimum.text = Fund().formatCurrency(fund.operabilityMinimum)
        cell.fundRisk.text = fund.fundRisk
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "FoundDetailViewController") as! FoundDetailViewController
        detailViewController.index = indexPath.row
        self.present(detailViewController, animated: true, completion: nil)
    }
    
}

