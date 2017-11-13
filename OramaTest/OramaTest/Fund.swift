//
//  Fund.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Fund {
    
    let simpleName : String
    let operabilityMinimum : Double
    let fundRisk: String
    
    init(simpleName: String = "", operabilityMinimum: Double = 0.0, fundRisk: String = "") {
        self.simpleName = simpleName
        self.operabilityMinimum = operabilityMinimum
        self.fundRisk = fundRisk
    }
    
    func getFunds() -> Array<Fund> {
        
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

    
}