//
//  ModelManager.swift
//  MySentence
//
//  Created by Tom geri on 22/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import UIKit

let sharedInstance = ModelManager()

class ModelManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModelManager
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath("SentenceDatabase.sqlite"))
        }
        return sharedInstance
    }
    
    
    func getAllSentences() -> [SentenceInfo] {
        
        let SentenceIntoQuery = "SELECT * FROM SentenceTable"
        
        let database = sharedInstance.database!
        database.open()
        
        guard let resultSet = database.executeQuery(SentenceIntoQuery, withArgumentsIn: nil) else {
            return []
        }
        
        var crimes = [SentenceInfo]()
        
        while resultSet.next() {
            crimes.append(SentenceInfo(fromResultSet: resultSet))
        }
        
        return crimes
        
    }
}
