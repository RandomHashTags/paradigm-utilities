//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo
    public let pictures:[WikipediaPicture], sources:EventSources?
    
    public init(pictures: [WikipediaPicture], sources: EventSources?) {
        type = SovereignStateInformationType.services_static
        info = SovereignStateInfo.service_wikipedia_featured_pictures
        self.pictures = pictures
        self.sources = sources
    }
}
