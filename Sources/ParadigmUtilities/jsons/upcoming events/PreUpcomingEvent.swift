//
//  PreUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreUpcomingEvent : Jsonable {
    public let type:UpcomingEventType, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64?, title:String, tag:String, imageURL:String?, countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public let productionCompanies:[String]?, popularity:Int?, awayTeam:ClientMLBTeam?, homeTeam:ClientMLBTeam?
    
    public init(type: UpcomingEventType, eventDate: EventDate!, exactStartMilliseconds: Int64!, exactEndMilliseconds: Int64? = nil, title: String, tag: String, imageURL: String?, countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, productionCompanies: [String]? = nil, popularity: Int? = nil, awayTeam: ClientMLBTeam? = nil, homeTeam: ClientMLBTeam? = nil) {
        self.type = type
        self.eventDate = eventDate
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        self.title = title
        self.tag = tag
        self.imageURL = imageURL
        self.countries = countries
        self.subdivisions = subdivisions
        self.productionCompanies = productionCompanies
        self.popularity = popularity
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
    }
    
    public func getIdentifier() -> String {
        if let eventDate:EventDate = eventDate {
            return PreUpcomingEvent.getEventDateIdentifier(dateString: eventDate.getDateString(), title: title)
        } else if let exactStartMilliseconds:Int64 = exactStartMilliseconds {
            return PreUpcomingEvent.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return PreUpcomingEvent.parseEventDateIdentifier(key: "NIL", title: title)
        }
    }
    
    public static func getEventDateIdentifier(dateString: String, title: String) -> String {
        return parseEventDateIdentifier(key: dateString, title: title)
    }
    public static func getEventDateIdentifier(exactTimeMilliseconds: Int64, title: String) -> String {
        return parseEventDateIdentifier(key: exactTimeMilliseconds.description, title: title)
    }
    private static func parseEventDateIdentifier(key: String, title: String) -> String {
        let id:String = title.replacingOccurrences(of: "[^a-zA-Z0-9]+", with: "_", options: .regularExpression)
        return key + "." + id
    }
}
