//
//  NewsEvent.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import SwiftSovereignStates

public struct NewsEvent : Jsonable {    
    public let id:String
    public var name:String?, description:String?
    public let image_url:String?, video_url:String?
    public var sources:EventSources
    
    public let related_countries:[Country]?
    public let related_subdivisions:[SovereignStateSubdivisionWrapper]?
    public let related_cities:[SovereignStateCityWrapper]?
    
    public init(id: String, name: String?, description: String?, image_url: String?, video_url: String?, sources: EventSources, related_countries: [Country]?, related_subdivisions: [SovereignStateSubdivisionWrapper]?, related_cities: [SovereignStateCityWrapper]?) {
        self.id = id
        self.name = name
        self.description = description
        self.image_url = image_url
        self.video_url = video_url
        self.sources = sources
        self.related_countries = related_countries
        self.related_subdivisions = related_subdivisions
        self.related_cities = related_cities
    }
}