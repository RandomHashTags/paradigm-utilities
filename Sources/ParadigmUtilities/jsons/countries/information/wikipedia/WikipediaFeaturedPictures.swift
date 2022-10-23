//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {
    public let imageURLPrefix:String, pictures:[WikipediaPicture]
    public var sources:EventSources?
    
    public init(imageURLPrefix: String, pictures: [WikipediaPicture], sources: EventSources?) {
        self.imageURLPrefix = imageURLPrefix
        self.pictures = pictures
        self.sources = sources
    }
}
