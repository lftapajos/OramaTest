//
//  Dao.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 13/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import Foundation

class Dao {
    
    let fundArchive: String
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        print(dir)
        fundArchive = "\(dir)/orama-teste-fund.data"
    }
    
    //Salva o Fundo
    func save(_ fund: Array<Fund>) {
        NSKeyedArchiver.archiveRootObject(fund, toFile: fundArchive)
    }
    
    //Carrega Fundos salvos
    func load() -> Array<Fund> {
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: fundArchive) {
            let funds = loaded as! Array<Fund>
            return funds
        }
        return []
    }
}
