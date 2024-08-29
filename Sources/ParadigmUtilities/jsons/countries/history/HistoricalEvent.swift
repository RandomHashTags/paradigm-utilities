//
//  HistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import SwiftSovereignStates

public struct HistoricalEvent : Jsonable {    
    public let id:String, date:EventDate
    public let exact_time_start:Int64?, exact_time_end:Int64?
    public var name:String, description:String
    public let image_urls:[String]?, video_urls:[String]?
    public let country:Country?, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?
    public var sources:EventSources
    
    public init(id: String, date: EventDate, exact_time_start: Int64?, exact_time_end: Int64?, name: String, description: String, image_urls: [String]?, video_urls: [String]?, country: Country?, subdivision: SovereignStateSubdivisionWrapper?, city: SovereignStateCityWrapper?, sources: EventSources) {
        self.id = id
        self.date = date
        self.exact_time_start = exact_time_start
        self.exact_time_end = exact_time_end
        self.name = name
        self.description = description
        self.image_urls = image_urls
        self.video_urls = video_urls
        self.country = country
        self.subdivision = subdivision
        self.city = city
        self.sources = sources
    }
}