//
//  FundDetail.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class FundDetail : NSObject, NSCoding {
    
    // MARK: Declarations
    let fullName : String
    let initialDate : String
    let strategyVideo: String?
    let fundManagerDescription: String
    let fundos : Array<Fund>
    
    // MARK: Constructor
    init(fullName: String = "", initialDate: String = "", strategyVideo: String = "", fundManagerDescription: String = "", fundos: Array<Fund> = []) {
        self.fullName = fullName
        self.initialDate = initialDate
        self.strategyVideo = strategyVideo
        self.fundManagerDescription = fundManagerDescription
        self.fundos = fundos
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fullName = aDecoder.decodeObject(forKey : "fullName") as! String
        self.initialDate = aDecoder.decodeObject(forKey: "initialDate") as! String
        self.strategyVideo = aDecoder.decodeObject(forKey : "strategyVideo") as? String
        self.fundManagerDescription = aDecoder.decodeObject(forKey : "fundManagerDescription") as! String
        self.fundos = aDecoder.decodeObject(forKey: "fundos") as! Array<Fund>
    }
    
    // MARK: Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(fullName, forKey: "fullName")
        aCoder.encode(initialDate, forKey : "initialDate")
        aCoder.encode(strategyVideo, forKey : "strategyVideo")
        aCoder.encode(fundManagerDescription, forKey : "fundManagerDescription")
        aCoder.encode(fundos, forKey: "fundos")
    }
    
    // MARK: Methods
    func getFundDetail() -> Array<FundDetail> {
        
        //Carrega os Detalhes dos Fundos salvos
        let details = Dao().loadDetailsFunds()
        return details
    }
}
