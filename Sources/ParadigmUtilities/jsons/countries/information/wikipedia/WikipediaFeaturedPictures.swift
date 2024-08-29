//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {    
    public let image_url_prefix:String
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(image_url_prefix: String, pictures: [WikipediaPicture], sources: EventSources?) {
        self.image_url_prefix = image_url_prefix
        self.pictures = pictures
        self.sources = sources
    }
}