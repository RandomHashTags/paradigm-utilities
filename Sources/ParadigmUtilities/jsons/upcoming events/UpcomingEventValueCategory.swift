//
//  UpcomingEventValueCategory.swift
//
//
//  Created by Evan Anderson on 6/15/22.
//

import Foundation

public enum UpcomingEventValueCategory : String {
    case astronomy_picture_of_the_day
    case joke_of_the_day
    case mlb
    case movie
    case movie_production_companies
    case music_album
    case near_earth_object
    case rocket_launch
    case science_year_review
    case space_event
    case space_lunar_eclipse
    case spotify_new_music_friday_tracks
    case ticketmaster_music_event
    case ticketmaster_music_event_accessibility
    case ticketmaster_music_event_ageRestriction
    case ticketmaster_music_event_healthCheck
    case ticketmaster_music_event_pleaseNote
    case ticketmaster_venues
    case video_game_details
    case video_game_genres
    case word_of_the_day_details
    case word_of_the_day_post_details
    case wrestling_details
    
    func value() -> UpcomingEventValueCategoryValue {
        switch self {
        case .astronomy_picture_of_the_day:            return getValue()
        case .joke_of_the_day:                         return getValue()
        case .mlb:                                     return getValue()
        case .movie:                                   return getValue(position: .pre_content)
        case .movie_production_companies:              return getValue(position: .post_videos, header: "Production Companies")
        case .music_album:                             return getValue()
        case .near_earth_object:                       return getValue()
        case .rocket_launch:                           return getValue(header: "Mission")
        case .science_year_review:                     return getValue(header: "%year%")
        case .space_event:                             return getValue()
        case .space_lunar_eclipse:                     return getValue()
        case .spotify_new_music_friday_tracks:         return getValue(header: "Songs")
        case .ticketmaster_music_event:                return getValue(position: .above_description)
        case .ticketmaster_music_event_accessibility:  return getValue(position: .post_description, header: "Accessibility")
        case .ticketmaster_music_event_ageRestriction: return getValue(position: .post_description, header: "Age Restriction")
        case .ticketmaster_music_event_healthCheck:    return getValue(position: .post_description, header: "Health Check")
        case .ticketmaster_music_event_pleaseNote:     return getValue(position: .post_description, header: "Please Note")
        case .ticketmaster_venues:                     return getValue(header: "Venues")
        case .video_game_details:                      return getValue(position: .pre_content, header: "Releasing for platforms")
        case .video_game_genres:                       return getValue(header: "Genres")
        case .word_of_the_day_details:                 return getValue(position: .above_description)
        case .word_of_the_day_post_details:            return getValue(position: .post_description)
        case .wrestling_details:                       return getValue(position: .above_description, header: "Main Event")
        }
    }
    private func getValue(position: UpcomingEventValueCategoryPosition = .post_videos, header: String? = nil) -> UpcomingEventValueCategoryValue {
        return UpcomingEventValueCategoryValue(rawValue, position: position, header: header)
    }
}

struct UpcomingEventValueCategoryValue : Hashable {
    let id:String, position:UpcomingEventValueCategoryPosition, header:String?
    
    fileprivate init(_ id: String, position: UpcomingEventValueCategoryPosition = .post_videos, header: String? = nil) {
        self.id = id
        self.position = position
        self.header = header
    }
    
    /*func toJSONObject() -> JSONObject {
        var json:JSONObject = JSONObject()
        json.putIfNotNil(key: "header", value: header, translateKey: true)
        json.put(key: "position", value: position.rawValue)
        return json
    }*/
    
    func toJsonable() -> UpcomingEventTypeCategoryResponse {
        return UpcomingEventTypeCategoryResponse(id: id, header: header, position: position.rawValue)
    }
}
