//
//  MusicAlbumEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct MusicAlbumEvent : UpcomingEventProtocol {
    public let eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, description:String?, location:String?, imageURL:String?, youtubeVideoIDs:[String]?, sources:EventSources
    public let hyperlinks:ClientHyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let artist:String, spotifyDetails:SpotifyDetails?, itunesDetails:ITunesDetails?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, artist: String, spotifyDetails: SpotifyDetails?, itunesDetails: ITunesDetails?) {
        self.eventDate = eventDate
        exactStartMilliseconds = nil
        exactEndMilliseconds = nil
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
        self.artist = artist
        self.spotifyDetails = spotifyDetails
        self.itunesDetails = itunesDetails
    }
    
    public func getType() -> UpcomingEventType {
        return UpcomingEventType.music_album
    }
}
