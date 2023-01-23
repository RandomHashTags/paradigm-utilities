//
//  SpotifyNewMusicFridayEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpotifyNewMusicFridayEventCodingKeys : String, UpcomingEventValueKeys {
    case tracks
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.spotify_new_music_friday_tracks
    }
    
    public func getValueType() -> UpcomingEventValueType {
        return UpcomingEventValueType.spotify_tracks
    }
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .tracks:
            return UpcomingEventValueCellType.spotify_tracks
        }
    }
}

public final class SpotifyNewMusicFridayEvent : GenericUpcomingEvent {
    public let tracks:[SpotifyTrack]
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, tracks: [SpotifyTrack]) {
        self.tracks = tracks
        super.init(type: UpcomingEventType.spotify_new_music_friday, event_date: eventDate, title: title, description: description, location: location, image_url: imageURL, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpotifyNewMusicFridayEventCodingKeys.self)
        tracks = try container.decode([SpotifyTrack].self, forKey: .tracks)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpotifyNewMusicFridayEventCodingKeys = key as? SpotifyNewMusicFridayEventCodingKeys else { return nil }
        switch key {
        case .tracks: return tracks
        }
    }
}
