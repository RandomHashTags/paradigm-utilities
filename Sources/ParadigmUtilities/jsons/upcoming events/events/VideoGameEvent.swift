//
//  VideoGameEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class VideoGameEvent : GenericUpcomingEvent {
    public let platforms:[String], genres:[String]
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, youtube_video_ids: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, platforms: [String], genres: [String]) {
        self.platforms = platforms
        self.genres = genres
        super.init(type: UpcomingEventType.video_game, event_date: event_date, title: title, description: description, location: location, image_url: image_url, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: VideoGameEventValueKeys.self)
        platforms = try container.decode([String].self, forKey: .platforms)
        genres = try container.decode([String].self, forKey: .genres)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:VideoGameEventValueKeys = key as? VideoGameEventValueKeys else { return nil }
        switch key {
        case .platforms: return platforms
        case .genres: return genres
        }
    }
}

public enum VideoGameEventValueKeys : String, UpcomingEventValueKeys {
    case platforms
    case genres
    
    public var category : UpcomingEventValueCategory {
        switch self {
        case .platforms:
            return UpcomingEventValueCategory.video_game_details
        case .genres:
            return UpcomingEventValueCategory.video_game_genres
        }
    }
}
