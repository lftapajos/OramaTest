//
//  API.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API {
    
    func loadApi() -> Bool {
        
        //let url = API_URL
        
        //var fundsApi : Array<Fund> = []
        
        var fundsApi : Array<Fund> = []
        var detailApi : Array<FundDetail> = []
        
        Alamofire.request(API_URL, method: .get)
            .responseJSON { response in
                if response.data != nil {
                    let json = JSON(data: response.data!)
                    
                    //print("json ======> \(json[0])")
                    
                    for i in 0 ..< 6 {
                        let simpleName = json[i]["simple_name"].stringValue
                        let operability = json[i]["operability"]
                            let minimum = operability["minimum_initial_application_amount"].doubleValue
                        let fundRisk = json[i]["specification"]
                            let risk = fundRisk["fund_risk_profile"]
                                let name = risk["name"].stringValue
                        let fullName = json[i]["full_name"].stringValue
                        let initialDate = json[i]["initial_date"].stringValue
                        let strategyVideo = json[i]["strategy_video"]
                            let description = strategyVideo["description"].stringValue
                            //let url = strategyVideo["url"].stringValue
                        let fund_manager = json[i]["fund_manager"]
                            let descriptionManager = fund_manager["description"].stringValue
                        
//                        print("\(i)")
//                        print("simple_name ======> \(simpleName)")
//                        print("operabilityMinimum ======> \(minimum)")
//                        print("fundRisk ======> \(name)")
 
//                        print("fullName ======> \(fullName)")
//                        print("initialDate ======> \(initialDate)")
//                        print("description ======> \(description)")
//                        print("url ======> \(url)")
//                        print("descriptionManager ======> \(descriptionManager)")
                        
                        
                        fundsApi.append(Fund(
                            simpleName: simpleName,
                            operabilityMinimum: minimum,
                            fundRisk: name)
                        )

                        detailApi.append(FundDetail(fullName: fullName,
                            initialDate: initialDate,
                            strategyVideo: description,
                            fundManagerDescription: descriptionManager)
                        )
                        
                    }
                    
                    //Salva os fundos recuperados da API
                    Dao().saveFunds(fundsApi)
                    
                    //Salva os detalhes dos fundos recuperados da API
                    Dao().saveDetailFunds(detailApi)
                }
        }
        
        return true
    }
    
}
