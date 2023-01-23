//
//  MusicAlbumEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum MusicAlbumEventCodingKeys : String, UpcomingEventValueKeys {
    case artist
    case spotifyDetails
    case itunesDetails
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.music_album
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .spotifyDetails:
            return UpcomingEventValueType.details_spotify
        case .itunesDetails:
            return UpcomingEventValueType.details_itunes
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
}

public final class MusicAlbumEvent : GenericUpcomingEvent {
    public let artist:String, spotifyDetails:SpotifyDetails?, itunesDetails:ITunesDetails?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, artist: String, spotifyDetails: SpotifyDetails?, itunesDetails: ITunesDetails?) {
        self.artist = artist
        self.spotifyDetails = spotifyDetails
        self.itunesDetails = itunesDetails
        super.init(type: UpcomingEventType.music_album, event_date: eventDate, title: title, description: description, location: location, image_url: imageURL, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MusicAlbumEventCodingKeys.self)
        artist = try container.decode(String.self, forKey: .artist)
        spotifyDetails = try container.decodeIfPresent(SpotifyDetails.self, forKey: .spotifyDetails)
        itunesDetails = try container.decodeIfPresent(ITunesDetails.self, forKey: .itunesDetails)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:MusicAlbumEventCodingKeys = key as? MusicAlbumEventCodingKeys else { return nil }
        switch key {
        case .artist: return artist
        case .spotifyDetails: return spotifyDetails
        case .itunesDetails: return itunesDetails
        }
    }
}
