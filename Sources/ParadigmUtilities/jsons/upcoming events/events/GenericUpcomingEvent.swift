//
//  GenericUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates
import ZippyJSON

public class GenericUpcomingEvent : GenericUpcomingEventProtocol {
    public typealias ValueKeys = GenericUpcomingEventValueKeys
    
    public static func == (lhs: GenericUpcomingEvent, rhs: GenericUpcomingEvent) -> Bool {
        return lhs.type == rhs.type && lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    
    public var type:UpcomingEventType!, id:String?, event_date:EventDate?, exact_start:Int64?, exact_end:Int64?
    public var custom_type_singular_name:String?
    
    public var title:String, tag:String?, description:String?
    public let location:String?, image_url:String?
    public var youtube_video_ids:Set<String>?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:Set<Country>?, subdivisions:Set<SovereignStateSubdivisionWrapper>?
    
    public init(type: UpcomingEventType, id: String? = nil, event_date: EventDate?, exact_start: Int64? = nil, exact_end: Int64? = nil, custom_type_singular_name: String? = nil, title: String, tag: String? = nil, description: String?, location: String?, image_url: String?, youtube_video_ids: Set<String>? = nil, sources: EventSources, hyperlinks: Hyperlinks? = nil, countries: Set<Country>? = nil, subdivisions: [any SovereignStateSubdivision]? = nil) {
        self.type = type
        self.id = id
        self.event_date = event_date
        self.exact_start = exact_start
        self.exact_end = exact_end
        self.custom_type_singular_name = custom_type_singular_name
        self.title = title
        self.tag = tag
        self.description = description
        self.location = location
        self.image_url = image_url
        self.youtube_video_ids = youtube_video_ids
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() }).unique_set()
    }
    
    public lazy var nonGenericEvent:GenericUpcomingEvent? = {
        guard let data:Data = toData() else { return nil }
        return GenericUpcomingEvent.parse(decoder: ZippyJSONDecoder(), data: data)
    }()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(getIdentifier())
    }
    
    public static func parse(decoder: ZippyJSONDecoder, data: Data) -> GenericUpcomingEvent? {
        do {
            let generic:GenericUpcomingEvent = try decoder.decode(GenericUpcomingEvent.self, from: data)
            switch generic.type {
            case .astronomy_picture_of_the_day:
                return try decoder.decode(APODEvent.self, from: data)
            case .joke_of_the_day:
                return try decoder.decode(JOTDEvent.self, from: data)
                
            case .movie:
                return try decoder.decode(MovieEvent.self, from: data)
            case .music_album:
                return try decoder.decode(MusicAlbumEvent.self, from: data)
            case .science_year_review:
                return try decoder.decode(ScienceYearReviewEvent.self, from: data)
            case .sport_mlb:
                return try decoder.decode(MLBEvent.self, from: data)
            case .sport_professional_wrestling:
                return try decoder.decode(ProfessionalWrestlingEvent.self, from: data)
                
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
            case .wikipedia_todays_featured_picture:
                return try decoder.decode(WikipediaTodaysFeaturedPictureEvent.self, from: data)
            case .word_of_the_day:
                return try decoder.decode(WOTDEvent.self, from: data)
            default:
                return generic
            }
        } catch {
            return nil
        }
    }
    
    public func getValue(_ key: String) -> Any? {
        guard let keys:[any UpcomingEventValueKeys] = type.getCodingKeys(), let codingKey:any UpcomingEventValueKeys = keys.first(where: { $0.rawValue.elementsEqual(key) }) else { return nil }
        return getValue(codingKey)
    }
    public func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        return nil
    }
    
    public func getKeyValue(key: GenericUpcomingEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .event_date: return event_date
        case .exact_start: return exact_start
        case .exact_end: return exact_end
        case .custom_type_singular_name: return custom_type_singular_name
        case .title: return title
        case .tag: return tag
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
    public func setKeyValue<T>(key: GenericUpcomingEventValueKeys, value: T) {
        switch key {
        case .custom_type_singular_name:
            custom_type_singular_name = value as? String
            break
        case .title:
            title = value as! String
            break
        case .tag:
            tag = value as? String
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
}

public enum GenericUpcomingEventValueKeys : String, JsonableValueKeys {
    case type
    case id
    case event_date
    case exact_start
    case exact_end
    case custom_type_singular_name
    case title
    case tag
    case description
    case location
    case image_url
    case youtube_video_ids
    case sources
    case hyperlinks
    case countries
    case subdivisions
    
    public func isTranslatable() -> Bool {
        switch self {
        case .custom_type_singular_name, .title, .tag, .description, .sources, .hyperlinks:
            return true
        default:
            return false
        }
    }
}
