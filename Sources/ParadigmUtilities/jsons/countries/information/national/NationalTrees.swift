//
//  NationalTrees.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct NationalTrees : SovereignStateNationalValue {    
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
}