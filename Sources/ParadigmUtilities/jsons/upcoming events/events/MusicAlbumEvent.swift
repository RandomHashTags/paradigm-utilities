//
//  MusicAlbumEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class MusicAlbumEvent : GenericUpcomingEvent {
    public let artist:String, spotify_details:SpotifyDetails?, itunes_details:ITunesDetails?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, artist: String, spotify_details: SpotifyDetails?, itunes_details: ITunesDetails?) {
        self.artist = artist
        self.spotify_details = spotify_details
        self.itunes_details = itunes_details
        super.init(type: UpcomingEventType.music_album, event_date: event_date, title: title, description: description, location: location, image_url: image_url, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MusicAlbumEventValueKeys.self)
        artist = try container.decode(String.self, forKey: .artist)
        spotify_details = try container.decodeIfPresent(SpotifyDetails.self, forKey: .spotify_details)
        itunes_details = try container.decodeIfPresent(ITunesDetails.self, forKey: .itunes_details)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:MusicAlbumEventValueKeys = key as? MusicAlbumEventValueKeys else { return nil }
        switch key {
        case .artist: return artist
        case .spotify_details: return spotify_details
        case .itunes_details: return itunes_details
        }
    }
}

public enum MusicAlbumEventValueKeys : String, UpcomingEventValueKeys {
    case artist
    case spotify_details
    case itunes_details
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.music_album
    }
    
    public var value_type : UpcomingEventValueType {
        switch self {
        case .spotify_details:
            return UpcomingEventValueType.details_spotify
        case .itunes_details:
            return UpcomingEventValueType.details_itunes
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
}
