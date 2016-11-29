//
//  SentenceStruct.swift
//  MySentence
//
//  Created by Tom geri on 22/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import Foundation

struct SentenceInfo {
    
    let name: String
    let detail: String
    let sentence: String
    
    init(name: String, detail: String, sentence: String) {
        self.name = name
        self.detail = detail
        self.sentence = sentence
    }
    
    init(fromResultSet: FMResultSet) {
        self.init(
            name: fromResultSet.string(forColumn: "Name"),
            detail: fromResultSet.string(forColumn: "Detail"),
            sentence: fromResultSet.string(forColumn: "Sentence")
        )
        
    }
}

struct SentenceNameSection {
    
    var firstLetter: String
    var crimes: [SentenceInfo]
    
    init(title: String, objects: [SentenceInfo]) {
        firstLetter = title
        crimes = objects
    }
}
