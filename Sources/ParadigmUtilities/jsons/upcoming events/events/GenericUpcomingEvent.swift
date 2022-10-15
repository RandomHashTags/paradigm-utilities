//
//  GenericUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct GenericUpcomingEvent : UpcomingEventProtocol {
    public let type:UpcomingEventType, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, description:String?, location:String?, imageURL:String?, youtubeVideoIDs:[String]?, sources:EventSources
    public let hyperlinks:ClientHyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public init(type: UpcomingEventType, eventDate: EventDate!, exactStartMilliseconds: Int64!, exactEndMilliseconds: Int64!, customTypeSingularName: String? = nil, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]? = nil, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?) {
        self.type = type
        self.eventDate = eventDate
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        self.customTypeSingularName = customTypeSingularName
        self.title = title
        self.description = description
        self.location = location
        self.imageURL = imageURL
        self.youtubeVideoIDs = youtubeVideoIDs
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
    }
    
    public func getType() -> UpcomingEventType {
        return type
    }
}
