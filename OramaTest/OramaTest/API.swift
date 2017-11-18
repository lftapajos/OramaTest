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
import AlamofireImage

class API {
    
    //Carrega os dados vindos da API
    func loadApi(completion: @escaping (Bool)->(), failureBlock: @escaping ()->Void) {
        
        var fundsApi : Array<Fund> = []
        var detailApi : Array<FundDetail> = []
        
        Alamofire.request(API_URL, method: .get)
            .responseJSON { response in
                if response.data != nil {
                    let json = JSON(data: response.data!)
                    
                    //Recupera somentes os 6 primeiros fundos da API
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
                            let thumbnail = strategyVideo["thumbnail"].stringValue
                            //let url = strategyVideo["url"].stringValue
                        let fund_manager = json[i]["fund_manager"]
                            let descriptionManager = fund_manager["description"].stringValue
                        
                        //Carrega fundos da API
                        fundsApi.append(Fund(
                            simpleName: simpleName,
                            operabilityMinimum: minimum,
                            fundRisk: name)
                        )

                        //Carrega detalhes dos fundos da API
                        detailApi.append(FundDetail(fullName: fullName,
                            initialDate: initialDate,
                            strategyVideo: thumbnail,
                            fundManagerDescription: descriptionManager,
                            fundos: fundsApi)
                        )
                        
                    }
                    
                    //Salva os fundos recuperados da API
                    Dao().saveFunds(fundsApi)
                    
                    //Salva os detalhes dos fundos recuperados da API
                    Dao().saveDetailFunds(detailApi)
                    
                    completion(true)
                }
        }
        
    }
        
}
