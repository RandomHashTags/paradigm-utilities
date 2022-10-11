//
//  UpcomingEventValueType.swift
//
//
//  Created by Evan Anderson on 6/13/22.
//

import Foundation

public enum UpcomingEventValueType : String, CaseIterable {
    case array_string
    case boolean
    case int
    case int64
    case float
    case json
    case string
    case placeholder
    
    case currency
    case currency_id
    case details_spotify
    case details_itunes
    case image
    case image_copyright
    case imdb_info
    case mlb_team
    case production_companies
    case spotify_tracks
    case ticketmaster_venues
    case timestamp
    case video_url
    case wikipedia_events
    
    static func defaultType() -> UpcomingEventValueType {
        return UpcomingEventValueType.string
    }
    
    static func valueOf(_ string: String?) -> UpcomingEventValueType? {
        guard let string:String = string else { return nil }
        return UpcomingEventValueType.allCases.first(where: { string.compare($0.rawValue) == .orderedSame })
    }
}
