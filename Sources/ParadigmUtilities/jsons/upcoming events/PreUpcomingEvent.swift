//
//  PreUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

// TODO: make protocol?
public struct PreUpcomingEvent : UpcomingEventProtocol {    
    public var type:UpcomingEventType?
    public var event_date:EventDate?
    public var begins:Date?
    public var ends:Date?
    
    /// A custom assigned identifier by the server which is only interacted with if the client needs to use the functionality in some way. Default is `nil`.
    ///
    /// An example would be the identifier of a TV Show event, so the client can view it using their service API (TVMaze), as the server doesn't handle those requests.
    public let id:String?
    public var title:String, tag:String
    public var images:[String]
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var custom_type_singular_name:String?
    public let client_emoji:Icon?
    
    public let url:String?, production_companies:[String]?, popularity:Int?
    public var team_away:ClientMLBTeam?, team_home:ClientMLBTeam?
    
    public init(type: UpcomingEventType?, id: String? = nil, event_date: EventDate?, begins: Date? = nil, ends: Date? = nil, title: String, tag: String, images: [String], countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, url: String? = nil, custom_type_singular_name: String? = nil, client_emoji: Icon? = nil, production_companies: [String]? = nil, popularity: Int? = nil, team_away: ClientMLBTeam? = nil, team_home: ClientMLBTeam? = nil) {
        self.type = type
        self.id = id
        self.event_date = event_date
        self.begins = begins
        self.ends = ends
        self.title = title
        self.tag = tag
        self.images = images
        self.countries = countries
        self.subdivisions = subdivisions
        self.custom_type_singular_name = custom_type_singular_name
        self.client_emoji = client_emoji
        self.url = url
        self.production_companies = production_companies
        self.popularity = popularity
        self.team_away = team_away
        self.team_home = team_home
    }
}
