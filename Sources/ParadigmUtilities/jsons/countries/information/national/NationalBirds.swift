//
//  NationalBirds.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct NationalBirds : SovereignStateNationalValue {
    public let pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
}
