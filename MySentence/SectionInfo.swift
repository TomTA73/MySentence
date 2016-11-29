//
//  SectionInfo.swift
//  MySentence
//
//  Created by Tom geri on 22/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import Foundation

class SectionInfo {
    
    var crimeInfo : [SentenceInfo] = ModelManager.getInstance().getAllSentences()
    
    
    func getSectionFromData() -> [SentenceNameSection] {
        
        let sections: [SentenceNameSection] = crimeInfo.sorted { $0.name < $1.name }
            .reduce([SentenceNameSection]()) { result, crime -> [SentenceNameSection] in
                let crimeFirstLetter = String(crime.name.characters.first ?? " ")
                
                guard let index = result.index(where: { $0.firstLetter == crimeFirstLetter }) else {
                    let newSection = SentenceNameSection(title: crimeFirstLetter, objects: [crime])
                    return result + [newSection]
                }
                
                var result = result
                var section = result[index]
                section.crimes.append(crime)
                result[index] = section
                return result
                
        }
        
        return sections
    }
}
