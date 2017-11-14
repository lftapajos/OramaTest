//
//  Fund.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Fund : NSObject, NSCoding{
    
    let simpleName : String
    let operabilityMinimum : Double
    let fundRisk: String
    
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(simpleName, forKey: "simpleName")
        aCoder.encode(operabilityMinimum, forKey : "operabilityMinimum")
        aCoder.encode(fundRisk, forKey : "fundRisk")
    }
    
    func getFunds() -> Array<Fund> {
        
        //Recupera os Fundos Mockados
        let funds = [
            Fund(simpleName: "Fundo 1", operabilityMinimum: 1500, fundRisk: "3"),
            Fund(simpleName: "Fundo 2", operabilityMinimum: 1000, fundRisk: "2"),
            Fund(simpleName: "Fundo 3", operabilityMinimum: 500, fundRisk: "1"),
            Fund(simpleName: "Fundo 4", operabilityMinimum: 2000, fundRisk: "4"),
            Fund(simpleName: "Fundo 5", operabilityMinimum: 4000, fundRisk: "5"),
            Fund(simpleName: "Fundo 6", operabilityMinimum: 5000, fundRisk: "6")
        ]
        
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
