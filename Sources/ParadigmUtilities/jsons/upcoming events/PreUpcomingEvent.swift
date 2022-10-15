//
//  PreUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreUpcomingEvent : Jsonable {
    public let type:UpcomingEventType, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64?, title:String, tag:String?, imageURL:String?, countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public let productionCompanies:[String]?, popularity:Int?
    
    public init(type: UpcomingEventType, eventDate: EventDate!, exactStartMilliseconds: Int64!, exactEndMilliseconds: Int64? = nil, title: String, tag: String?, imageURL: String?, countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, productionCompanies: [String]? = nil, popularity: Int? = nil) {
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
    }
}
