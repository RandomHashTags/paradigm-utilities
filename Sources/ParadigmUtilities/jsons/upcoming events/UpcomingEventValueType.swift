//
//  UpcomingEventValueType.swift
//
//
//  Created by Evan Anderson on 6/13/22.
//

public enum UpcomingEventValueType : String, CaseIterable, Jsonable {
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
    
    public static var default_type : UpcomingEventValueType {
        return UpcomingEventValueType.string
    }
}
