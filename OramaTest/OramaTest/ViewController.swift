//
//  ViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 10/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let fundItems: Array<Fund> = Fund().getFunds()
    
    @IBOutlet weak var viewHistory: UIView!
    @IBOutlet weak var fundCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewHistory.layer.cornerRadius = 10
        
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
        cell.operabilityMinimum.text = "R$ \(fund.operabilityMinimum)"
        cell.fundRisk.text = fund.fundRisk
        
        return cell
    }

}

