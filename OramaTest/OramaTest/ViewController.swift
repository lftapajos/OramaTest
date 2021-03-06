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
    var overlayView = UIView()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewHistory: UIView!
    @IBOutlet weak var fundCollectionView: UICollectionView!
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
 
        fundCollectionView.dataSource = self
        fundCollectionView.delegate = self
        
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            titleLabel.font = titleLabel.font.withSize(21.0)
        } else {
            titleLabel.font = titleLabel.font.withSize(41.0)
        }
        
        self.viewHistory.layer.cornerRadius = 10
        
        //Carrega Loading enquanto os dados não são carregados pela chamada da API
        self.overlayView = OverlayView().loadView(self.view)
        self.view.addSubview(self.overlayView)
        
        //Chama a API que salva os Fundos e detalhes dos Fundos
        API().loadApi(completion: { (loaded) in
            
            //Se carregou, mostra os dados
            if (loaded) {
                
                //Remove overlayView
                self.overlayView.removeFromSuperview()
                
                //Alimenta os Fundos no Array
                self.fundItems = Fund().getFunds()
                
                //Recarrega a collectionView
                self.fundCollectionView.reloadData()
            }
            
        }, failureBlock: {
            //Erro ao carregar dados da API
            Alert(controller: self).show("Sorry", message: "Error to load data")
            
        })
        
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
    @IBAction func showHistoric(_ sender: Any) {
        let historicViewController = storyboard?.instantiateViewController(withIdentifier: "HistoricViewController") as! HistoricViewController
        
        view.window!.layer.add(Transitions().transitionFromRight(), forKey: kCATransition)
        self.present(historicViewController, animated: false, completion: nil)
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
        cell.configureCell(fund)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "FoundDetailViewController") as! FoundDetailViewController
        detailViewController.index = indexPath.row
        
        view.window!.layer.add(Transitions().transitionFromRight(), forKey: kCATransition)
        self.present(detailViewController, animated: false, completion: nil)
    }
}
