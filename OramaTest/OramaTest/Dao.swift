//
//  Dao.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Dao {
    
    // MARK: Declarations
    let fundArchive: String
    let detailFundArchive: String
    let historicArchive: String
    
    // MARK: Constructor
    init() {
        
        //Configura caminho para salvar as informações dos Fundos comprados
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        //print(dir)
        
        //Configura arquivos
        fundArchive = "\(dir)/orama-test-fund.data"
        detailFundArchive = "\(dir)/orama-test-detail-fund.data"
        historicArchive = "\(dir)/orama-test-historic.data"
    }
    
    // MARK: Methods
    //Salva o Fundo no Histórico
    func save(_ fund: Array<FundDetail>) {
        NSKeyedArchiver.archiveRootObject(fund, toFile: historicArchive)
    }
    
    //Carrega Fundos salvos no Histórico
    func load() -> Array<FundDetail> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: historicArchive) {
            let funds = loaded as! Array<FundDetail>
            return funds
        }
        return []
    }
    
    //Salva a lista completa de Fundos
    func saveFunds(_ funds: Array<Fund>) {
        
        //Carrega função para extrair dados dos fundos e salvar
        NSKeyedArchiver.archiveRootObject(funds, toFile: fundArchive)
    }
    
    //Carrega os Fundos salvos
    func loadFunds() -> Array<Fund> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: fundArchive) {
            let funds = loaded as! Array<Fund>
            return funds
        }
        return []
    }
    
    //Salva a lista completa de Detalhes dos Fundos
    func saveDetailFunds(_ detail: Array<FundDetail>) {
        
        //Carrega função para extrair detalhes dos dados dos fundos e salvar
        NSKeyedArchiver.archiveRootObject(detail, toFile: detailFundArchive)
    }

    //Carrega os Detalhes dos Fundos salvos
    func loadDetailsFunds() -> Array<FundDetail> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: detailFundArchive) {
            let details = loaded as! Array<FundDetail>
            return details
        }
        return []
    }
}
