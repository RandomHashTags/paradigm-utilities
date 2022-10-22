//
//  PreUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreUpcomingEvent : UpcomingEventProtocol {
    public let type:UpcomingEventType, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!, title:String, tag:String
    public var imageURL:String?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public let customTypeSingularName:String?, clientEmoji:Icon?
    public let url:String?, productionCompanies:[String]?, popularity:Int?, awayTeam:ClientMLBTeam?, homeTeam:ClientMLBTeam?
    
    public init(type: UpcomingEventType, eventDate: EventDate!, exactStartMilliseconds: Int64! = nil, exactEndMilliseconds: Int64! = nil, title: String, tag: String, imageURL: String?, countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, url: String? = nil, customTypeSingularName: String? = nil, clientEmoji: Icon? = nil, productionCompanies: [String]? = nil, popularity: Int? = nil, awayTeam: ClientMLBTeam? = nil, homeTeam: ClientMLBTeam? = nil) {
        self.type = type
        self.eventDate = eventDate
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        self.title = title
        self.tag = tag
        self.imageURL = imageURL
        self.countries = countries
        self.subdivisions = subdivisions
        self.customTypeSingularName = customTypeSingularName
        self.clientEmoji = clientEmoji
        self.url = url
        self.productionCompanies = productionCompanies
        self.popularity = popularity
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
    }
}
