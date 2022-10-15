//
//  NationalAnimals.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnimals : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        type = .national
        info = .national_animals
        self.pictures = pictures
        self.sources = sources
    }
}
