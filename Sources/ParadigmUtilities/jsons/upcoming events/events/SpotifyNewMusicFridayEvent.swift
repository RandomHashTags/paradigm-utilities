//
//  SpotifyNewMusicFridayEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class SpotifyNewMusicFridayEvent : GenericUpcomingEvent {
    public let tracks:Set<SpotifyTrack>
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, tracks: Set<SpotifyTrack>) {
        self.tracks = tracks
        super.init(type: UpcomingEventType.spotify_new_music_friday, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpotifyNewMusicFridayEventValueKeys.self)
        tracks = try container.decode(Set<SpotifyTrack>.self, forKey: .tracks)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpotifyNewMusicFridayEventValueKeys = key as? SpotifyNewMusicFridayEventValueKeys else { return nil }
        switch key {
        case .tracks: return tracks
        }
    }
}

public enum SpotifyNewMusicFridayEventValueKeys : String, UpcomingEventValueKeys {
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
