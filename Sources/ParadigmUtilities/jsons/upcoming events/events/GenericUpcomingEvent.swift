//
//  GenericUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum GenericUpcomingEvents {
    public static func parse<T: GenericUpcomingEvent>(data: Data) -> T? {
        return parse_any(data: data) as? T
    }
    public static func parse_any<T: GenericUpcomingEvent>(data: Data) -> T? {
        return try? ParadigmUtilities.json_decoder.decode(T.self, from: data)
    }
    private static func parse_any(data: Data) -> (any GenericUpcomingEvent)? {
        do {
            let decoder:JSONDecoder = ParadigmUtilities.json_decoder
            let generic:GenericUpcomingEventType = try decoder.decode(GenericUpcomingEventType.self, from: data)
            switch generic.type {
            case .astronomy_picture_of_the_day:
                return try decoder.decode(APODEvent.self, from: data)
            case .earth_observatory_image_of_the_day:
                return try decoder.decode(EarthObservatoryImageOfTheDayEvent.self, from: data)
            case .joke_of_the_day:
                return try decoder.decode(JOTDEvent.self, from: data)
                
            case .movie:
                return try decoder.decode(MovieEvent.self, from: data)
            case .music_album:
                return try decoder.decode(MusicAlbumEvent.self, from: data)
            case .presentations:
                return try decoder.decode(PresentationEvent.self, from: data)
            case .science_year_review:
                return try decoder.decode(ScienceYearReviewEvent.self, from: data)
            case .sport_championships:
                return try decoder.decode(SportChampionshipEvent.self, from: data)
            case .sport_mlb:
                return try decoder.decode(MLBEvent.self, from: data)
            case .sport_professional_wrestling:
                return try decoder.decode(ProfessionalWrestlingEvent.self, from: data)
            case .sport_ufc:
                return try decoder.decode(UFCEvent.self, from: data)
                
            case .space_event:
                return try decoder.decode(SpaceEvent.self, from: data)
            case .space_lunar_eclipse:
                return try decoder.decode(SpaceLunarEclipseEvent.self, from: data)
            case .space_near_earth_object:
                return try decoder.decode(SpaceNearEarthObjectEvent.self, from: data)
            case .space_rocket_launch:
                return try decoder.decode(SpaceRocketLaunchEvent.self, from: data)
            
            case .spotify_new_music_friday:
                return try decoder.decode(SpotifyNewMusicFridayEvent.self, from: data)
            case .ticketmaster_music_event:
                return try decoder.decode(TicketmasterMusicEvent.self, from: data)
            case .video_game:
                return try decoder.decode(VideoGameEvent.self, from: data)
            case .video_game_events:
                return try decoder.decode(VideoGameEventsEvent.self, from: data)
            case .wikipedia_todays_featured_picture:
                return try decoder.decode(WikipediaTodaysFeaturedPictureEvent.self, from: data)
            case .word_of_the_day:
                return try decoder.decode(WOTDEvent.self, from: data)
                
            default:
                return nil
            }
        } catch {
            return nil
        }
    }
}

public struct GenericUpcomingEventType : Codable {
    public let type:UpcomingEventType
}

public protocol GenericUpcomingEvent : UpcomingEventProtocol where JSONKeys : UpcomingEventValueKeys {
    var description : String? { get set }
    var location : String? { get set }
    var youtube_video_ids : [String]? { get set }
    var sources : EventSources { get set }
    var hyperlinks : Hyperlinks? { get set }
}
public extension GenericUpcomingEvent {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.type == rhs.type && lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    
    func getValue<T>(_ key: String) -> T? {
        if let codingKey:JSONKeys = JSONKeys.init(rawValue: key) {
            return getKeyValue(key: codingKey) as? T
        } else if let key:GenericUpcomingEventValueKeys = GenericUpcomingEventValueKeys.init(rawValue: key) {
            return getKeyValue(key: key) as? T
        } else {
            return nil
        }
    }
    
    func getKeyValue(key: GenericUpcomingEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .event_date: return event_date
        case .exact_start: return exact_start
        case .exact_end: return exact_end
        case .custom_type_singular_name: return custom_type_singular_name
        case .title: return title
        case .description: return description
        case .location: return location
        case .image_url: return image_url
        case .youtube_video_ids: return youtube_video_ids
        case .sources: return sources
        case .hyperlinks: return hyperlinks
        case .countries: return countries
        case .subdivisions: return subdivisions
        }
    }
    mutating func setKeyValue<T>(key: GenericUpcomingEventValueKeys, value: T) {
        switch key {
        case .custom_type_singular_name:
            custom_type_singular_name = value as? String
            break
        case .title:
            title = value as! String
            break
        case .description:
            description = value as? String
            break
        case .sources:
            sources = value as! EventSources
            break
        case .hyperlinks:
            hyperlinks = value as? Hyperlinks
            break
        default:
            break
        }
    }
    
    func to_pre_upcoming_event(tag: String?, countries: [Country]? = nil) -> PreUpcomingEvent {
        return PreUpcomingEvent(type: type, event_date: event_date, exact_start: exact_start, exact_end: exact_end, title: title, tag: tag ?? "", image_url: image_url, countries: countries, custom_type_singular_name: custom_type_singular_name)
    }
}

public enum GenericUpcomingEventValueKeys : String, JsonableKeys {
    case type
    case event_date
    case exact_start
    case exact_end
    case custom_type_singular_name
    case title
    case description
    case location
    case image_url
    case youtube_video_ids
    case sources
    case hyperlinks
    case countries
    case subdivisions
    
    public var is_translatable : Bool {
        switch self {
        case .custom_type_singular_name, .title, .description, .sources, .hyperlinks:
            return true
        default:
            return false
        }
    }
}
