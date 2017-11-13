//
//  FundDetail.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class FundDetail {
    
    let fullName : String
    let initialDate : String
    let strategyVideo: String?
    let fundManagerDescription: String
    
    init(fullName: String = "", initialDate: String = "", strategyVideo: String = "", fundManagerDescription: String = "") {
        self.fullName = fullName
        self.initialDate = initialDate
        self.strategyVideo = strategyVideo
        self.fundManagerDescription = fundManagerDescription
    }
    
    func getFundDetail() -> Array<FundDetail> {
        
        let detail = [
            FundDetail(fullName: "Fundo de Investimento 1", initialDate: "01-12", strategyVideo: "image1.jpg", fundManagerDescription: "Fundo de investimento para carteira 1"),
            FundDetail(fullName: "Fundo de Investimento 2", initialDate: "01-12", strategyVideo: "image2.jpg", fundManagerDescription: "Fundo de investimento para carteira 2"),
            FundDetail(fullName: "Fundo de Investimento 3", initialDate: "03-12", strategyVideo: "image3.jpg", fundManagerDescription: "Fundo de investimento para carteira 3"),
            FundDetail(fullName: "Fundo de Investimento 4", initialDate: "05-12", strategyVideo: "image4.jpg", fundManagerDescription: "Fundo de investimento para carteira 4"),
            FundDetail(fullName: "Fundo de Investimento 5", initialDate: "10-12", strategyVideo: "image5.jpg", fundManagerDescription: "Fundo de investimento para carteira 5"),
            FundDetail(fullName: "Fundo de Investimento 6", initialDate: "15-12", strategyVideo: "image6.jpg", fundManagerDescription: "Fundo de investimento para carteira 6"),
            ]
        
        return detail
    }
}
