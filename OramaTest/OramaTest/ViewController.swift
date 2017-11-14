//
//  ViewController.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 10/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Declarations
    var fundItems: Array<Fund> = []
    
    @IBOutlet weak var viewHistory: UIView!
    @IBOutlet weak var fundCollectionView: UICollectionView!
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
 
        fundCollectionView.dataSource = self
        fundCollectionView.delegate = self
        
        self.viewHistory.layer.cornerRadius = 10
        
        //Chama a API que salva os Fundos
        if (API().loadApi()) {
            
            //Carregou os dados
            print("Dados carregados")
            
            //Alimenta os Fundos no Array
            fundItems = Fund().getFunds()
            
        } else {
            
            //Erro ao carregar dados da API
            Alert(controller: self).show("Sorry", message: "Error to load data")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Methods
    @IBAction func showHistoric(_ sender: Any) {
        let historicViewController = storyboard?.instantiateViewController(withIdentifier: "HistoricViewController") as! HistoricViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(historicViewController, animated: false, completion: nil)
        
        //self.present(historicViewController, animated: true, completion: nil)
    }
}

// MARK: CollectionView Delegate
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
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
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(detailViewController, animated: false, completion: nil)
        
        //self.present(detailViewController, animated: true, completion: nil)
    }
}
