//
//  Fund.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Fund : NSObject, NSCoding {
    
    // MARK: Declarations
    let simpleName : String
    let operabilityMinimum : Double
    let fundRisk: String
    
    // MARK: Constructors
    init(simpleName: String = "", operabilityMinimum: Double = 0.0, fundRisk: String = "") {
        self.simpleName = simpleName
        self.operabilityMinimum = operabilityMinimum
        self.fundRisk = fundRisk
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.simpleName = aDecoder.decodeObject(forKey : "simpleName") as! String
        self.operabilityMinimum = aDecoder.decodeDouble(forKey: "operabilityMinimum")
        self.fundRisk = aDecoder.decodeObject(forKey : "fundRisk") as! String
    }
    
    // MARK: Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(simpleName, forKey: "simpleName")
        aCoder.encode(operabilityMinimum, forKey : "operabilityMinimum")
        aCoder.encode(fundRisk, forKey : "fundRisk")
    }
    
    func getFunds() -> Array<Fund> {
        
        //Carrega os Fundos salvos
        let funds = Dao().loadFunds()
        return funds
    }

    func formatCurrency(_ value: Double) -> String{
        return "R$ \(value)"
    }
    
    func getFundItem(position fund: Int) -> Fund {
        
        //Carrega a lista completa de fundos
        let fundsItems = getFunds()
        
        //Filtra e Recupera o fundo da posição chamada
        let fundToBuy = fundsItems[fund]

        return fundToBuy
    }
}
