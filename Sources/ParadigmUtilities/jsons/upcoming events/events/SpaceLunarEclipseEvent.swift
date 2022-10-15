//
//  SpaceLunarEclipseEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct SpaceLunarEclipseEvent : UpcomingEventProtocol {
    public let eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, description:String?, location:String?, imageURL:String?, youtubeVideoIDs:[String]?, sources:EventSources
    public let hyperlinks:ClientHyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let timeGreatestMilliseconds:Int64, orbitalNode:String, saros:String, gamma:String, magnitudePenumbra:String, magnitudeUmbra:String, durationPartial:Int, durationTotal:Int
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, timeGreatestMilliseconds: Int64, orbitalNode: String, saros: String, gamma: String, magnitudePenumbra: String, magnitudeUmbra: String, durationPartial: Int, durationTotal: Int) {
        eventDate = nil
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        customTypeSingularName = nil
        self.title = title
        self.description = description
        self.location = location
        self.imageURL = imageURL
        youtubeVideoIDs = nil
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.timeGreatestMilliseconds = timeGreatestMilliseconds
        self.orbitalNode = orbitalNode
        self.saros = saros
        self.gamma = gamma
        self.magnitudePenumbra = magnitudePenumbra
        self.magnitudeUmbra = magnitudeUmbra
        self.durationPartial = durationPartial
        self.durationTotal = durationTotal
    }
    
    public func getType() -> UpcomingEventType {
        return UpcomingEventType.space_lunar_eclipse
    }
}
