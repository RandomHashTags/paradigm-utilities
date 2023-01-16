//
//  VideoGameEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum VideoGameEventCodingKeys : String, UpcomingEventCodingKeys {
    case platforms
    case genres
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .platforms:
            return UpcomingEventValueCategory.video_game_details
        case .genres:
            return UpcomingEventValueCategory.video_game_genres
        }
    }
}

public final class VideoGameEvent : GenericUpcomingEvent {
    public let platforms:[String], genres:[String]
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, platforms: [String], genres: [String]) {
        self.platforms = platforms
        self.genres = genres
        super.init(type: UpcomingEventType.video_game, event_date: eventDate, title: title, description: description, location: location, image_url: imageURL, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: VideoGameEventCodingKeys.self)
        platforms = try container.decode([String].self, forKey: .platforms)
        genres = try container.decode([String].self, forKey: .genres)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:VideoGameEventCodingKeys = key as? VideoGameEventCodingKeys else { return nil }
        switch key {
        case .platforms: return platforms
        case .genres: return genres
        }
    }
}
