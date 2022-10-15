//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct ProfessionalWrestlingEvent : UpcomingEventProtocol {
    public let eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, description:String?, location:String?, imageURL:String?, youtubeVideoIDs:[String]?, sources:EventSources
    public let hyperlinks:ClientHyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
        
    public let mainEvent:String, notes:String?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, mainEvent: String, notes: String?) {
        self.eventDate = eventDate
        exactStartMilliseconds = nil
        exactEndMilliseconds = nil
        customTypeSingularName = nil
        self.title = title
        self.description = description
        self.location = location
        self.imageURL = imageURL
        self.youtubeVideoIDs = youtubeVideoIDs
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.mainEvent = mainEvent
        self.notes = notes
    }
    
    public func getType() -> UpcomingEventType {
        return UpcomingEventType.sport_professional_wrestling
    }
}
