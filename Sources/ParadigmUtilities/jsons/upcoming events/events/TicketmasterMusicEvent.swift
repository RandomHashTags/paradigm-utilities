//
//  TicketmasterMusicEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct TicketmasterMusicEvent : GenericUpcomingEventProtocol {
    public let eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, description:String?, location:String?, imageURL:String?, youtubeVideoIDs:[String]?, sources:EventSources
    public let hyperlinks:ClientHyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let accessibility:String?, ageRestriction:String?, healthCheckSummary:String?, healthCheckDescription:String?, pleaseNote:String?, seatMapURL:String?, ticketLimit:String?, priceRangeCurrency:String?, priceRangeMax:Float?, priceRangeMin:Float?, priceRangeString:String?, venues:[TicketmasterVenue]?
    
    public init(exactStartMilliseconds:Int64, exactEndMilliseconds:Int64, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, accessibility: String?, ageRestriction: String?, healthCheckSummary: String?, healthCheckDescription: String?, pleaseNote: String?, seatMapURL: String?, ticketLimit: String?, priceRangeCurrency: String?, priceRangeMax: Float?, priceRangeMin: Float?, priceRangeString: String?, venues: [TicketmasterVenue]?) {
        eventDate = nil
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
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
        self.accessibility = accessibility
        self.ageRestriction = ageRestriction
        self.healthCheckSummary = healthCheckSummary
        self.healthCheckDescription = healthCheckDescription
        self.pleaseNote = pleaseNote
        self.seatMapURL = seatMapURL
        self.ticketLimit = ticketLimit
        self.priceRangeCurrency = priceRangeCurrency
        self.priceRangeMax = priceRangeMax
        self.priceRangeMin = priceRangeMin
        self.priceRangeString = priceRangeString
        self.venues = venues
    }
    
    public func getType() -> UpcomingEventType {
        return UpcomingEventType.ticketmaster_music_event
    }
}
