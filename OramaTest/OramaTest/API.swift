//
//  API.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class API {
    
    func loadApi() -> Bool {
        
        //let url = API_URL
        
        let funds = [
            Fund(simpleName: "Fundo 1", operabilityMinimum: 1500, fundRisk: "3"),
            Fund(simpleName: "Fundo 2", operabilityMinimum: 1000, fundRisk: "2"),
            Fund(simpleName: "Fundo 3", operabilityMinimum: 500, fundRisk: "1"),
            Fund(simpleName: "Fundo 4", operabilityMinimum: 2000, fundRisk: "4"),
            Fund(simpleName: "Fundo 5", operabilityMinimum: 4000, fundRisk: "5"),
            Fund(simpleName: "Fundo 6", operabilityMinimum: 5000, fundRisk: "6")
        ]
        
        //Salva os fundos recuperados da API
        Dao().saveFunds(funds)
        
        let detail = [
            FundDetail(fullName: "Fundo de Investimento 1", initialDate: "01-12", strategyVideo: "image1.jpg", fundManagerDescription: "Fundo de investimento para carteira 1"),
            FundDetail(fullName: "Fundo de Investimento 2", initialDate: "01-12", strategyVideo: "image2.jpg", fundManagerDescription: "Fundo de investimento para carteira 2"),
            FundDetail(fullName: "Fundo de Investimento 3", initialDate: "03-12", strategyVideo: "image3.jpg", fundManagerDescription: "Fundo de investimento para carteira 3"),
            FundDetail(fullName: "Fundo de Investimento 4", initialDate: "05-12", strategyVideo: "image4.jpg", fundManagerDescription: "Fundo de investimento para carteira 4"),
            FundDetail(fullName: "Fundo de Investimento 5", initialDate: "10-12", strategyVideo: "image5.jpg", fundManagerDescription: "Fundo de investimento para carteira 5"),
            FundDetail(fullName: "Fundo de Investimento 6", initialDate: "15-12", strategyVideo: "image6.jpg", fundManagerDescription: "Fundo de investimento para carteira 6"),
            ]
        
        //Salva os detalhes dos fundos recuperados da API
        Dao().saveDetailFunds(detail)
        
        return true
    }
    
}
