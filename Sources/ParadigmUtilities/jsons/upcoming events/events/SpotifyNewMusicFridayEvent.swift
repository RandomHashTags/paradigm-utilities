//
//  SpotifyNewMusicFridayEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpotifyNewMusicFridayEventCodingKeys : String, UpcomingEventCodingKeys {
    case tracks
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.spotify_new_music_friday_tracks
    }
    
    public func getValueType() -> UpcomingEventValueType {
        return UpcomingEventValueType.spotify_tracks
    }
}

public final class SpotifyNewMusicFridayEvent : GenericUpcomingEvent {
    public let tracks:[SpotifyTrack]
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, tracks: [SpotifyTrack]) {
        self.tracks = tracks
        super.init(type: UpcomingEventType.spotify_new_music_friday, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: youtubeVideoIDs, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpotifyNewMusicFridayEventCodingKeys.self)
        tracks = try container.decode([SpotifyTrack].self, forKey: .tracks)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:SpotifyNewMusicFridayEventCodingKeys = key as? SpotifyNewMusicFridayEventCodingKeys else { return nil }
        switch key {
        case .tracks: return tracks
        }
    }
}
