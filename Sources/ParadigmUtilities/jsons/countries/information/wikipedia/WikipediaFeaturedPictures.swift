//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {
    public let pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        self.pictures = pictures
        self.sources = sources
    }
}
