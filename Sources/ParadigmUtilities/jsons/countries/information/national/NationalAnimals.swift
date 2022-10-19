//
//  NationalAnimals.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnimals : SovereignStateInformationValue {
    public let pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
}
