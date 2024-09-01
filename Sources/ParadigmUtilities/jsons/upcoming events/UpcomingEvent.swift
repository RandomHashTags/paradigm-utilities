//
//  UpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 8/28/24.
//

import Foundation
import SwiftSovereignStates

// MARK: AnyUpcomingEvent
public protocol AnyUpcomingEvent : Codable {
    var type : UpcomingEventType { get }
    var event_date : EventDate? { get }
    var begins : Date? { get }
    var ends : Date? { get }

    var title : String { get }
    var description : String? { get set }
    var location : String? { get set }

    var images : [String] { get }
    var countries : [Country]? { get }
    var subdivisions : [SovereignStateSubdivisionWrapper]? { get }

    var youtube_video_ids : [String]? { get set }
    var sources : EventSources { get set }
    var hyperlinks : Hyperlinks? { get set }
}
public enum AnyUpcomingEventValueKeys : String, JsonableKeys {
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
}


// MARK: UpcomingEvent
public struct UpcomingEvent<T: UpcomingEventData> : AnyUpcomingEvent, Equatable {
    public let type:UpcomingEventType
    public var event_date:EventDate?
    public var begins:Date?
    public var ends:Date? 
    
    public var custom_type_singular_name:String?
    
    public var title:String
    public var description:String?
    public var location:String?

    public var images:[String] {
        didSet { images = Self.optimize_images(type: type, images) }
    }
    public var countries:[Country]?
    public var subdivisions:[SovereignStateSubdivisionWrapper]?

    public var youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?

    public var data:T

    public init(
        event_date: EventDate?,
        begins: Date?,
        ends: Date?,

        custom_type_singular_name: String? = nil,

        title: String,
        description: String?,
        location: String?,

        images: [String],
        countries: [Country]?,
        subdivisions: [SovereignStateSubdivisionWrapper]?,

        youtube_video_ids: [String]? = nil,
        sources: EventSources,
        hyperlinks: Hyperlinks?,

        data: T
    ) {
        self.type = T.event_type
        self.event_date = event_date
        self.begins = begins
        self.ends = ends

        self.custom_type_singular_name = custom_type_singular_name

        self.title = title
        self.description = description
        self.location = location

        self.images = Self.optimize_images(type: type, images)
        self.countries = countries
        self.subdivisions = subdivisions

        self.youtube_video_ids = youtube_video_ids
        self.sources = sources
        self.hyperlinks = hyperlinks

        self.data = data
    }

    public func getKeyValue(key: AnyUpcomingEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .event_date: return event_date
        case .exact_start: return begins
        case .exact_end: return ends
        case .custom_type_singular_name: return custom_type_singular_name
        case .title: return title
        case .description: return description
        case .location: return location
        case .image_url: return images
        case .youtube_video_ids: return youtube_video_ids
        case .sources: return sources
        case .hyperlinks: return hyperlinks
        case .countries: return countries
        case .subdivisions: return subdivisions
        }
    }
}
public extension UpcomingEvent {
    func getValueKeys() -> T.JSONKeys.AllCases {
        return T.JSONKeys.allCases
    }
    func getKeyValue(_ key: String) -> Any? {
        guard let key:T.JSONKeys = T.JSONKeys(rawValue: key) else { return nil }
        return data.getKeyValue(key: key)
    }

    private static func optimize_images(type: UpcomingEventType, _ images: [String]) -> [String] {
        guard let prefix:String = type.image_url_prefix else { return images }
        return images.map({ $0.starts(with: prefix) ? $0.substring(from: prefix.count) : $0 })
    }
    func getValue<V>(_ key: String) -> V? {
        if let codingKey:T.JSONKeys = T.JSONKeys.init(rawValue: key) {
            return data.getKeyValue(key: codingKey) as? V
        } else if let key:AnyUpcomingEventValueKeys = AnyUpcomingEventValueKeys.init(rawValue: key) {
            return getKeyValue(key: key) as? V
        } else {
            return nil
        }
    }

    var date_string : String? {
        return event_date?.date_string
    }
    
    var id : String {
        if let eventDate:EventDate = event_date {
            return ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.date_string, title: title)
        } else if let exactStartMilliseconds:Int64 = begins?.milliseconds {
            return ParadigmUtilities.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return ParadigmUtilities.getEventDateIdentifier(dateString: "NIL", title: title)
        }
    }

    func to_pre_upcoming_event(tag: String?, countries: [Country]? = nil) -> PreUpcomingEvent {
        return PreUpcomingEvent(type: type, event_date: event_date, begins: begins, ends: ends, title: title, tag: tag ?? "", images: images, countries: countries, custom_type_singular_name: custom_type_singular_name)
    }
}

// MARK: UpcomingEventData
public protocol UpcomingEventData : Codable, Equatable {
    static var event_type : UpcomingEventType { get }
    associatedtype JSONKeys:JsonableKeys = NoJsonableKeys

    func getKeyValue(key: JSONKeys) -> Any?
}
public extension UpcomingEventData {
    func getValueKeys() -> JSONKeys.AllCases {
        return JSONKeys.allCases
    }
    
    func getKeyValue(_ key: String) -> Any? {
        guard let key:JSONKeys = JSONKeys(rawValue: key) else { return nil }
        return getKeyValue(key: key)
    }
}
public extension UpcomingEventData where JSONKeys == NoJsonableKeys {
    func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
}

private struct UpcomingEventTypeCodable : UpcomingEventData {
    static var event_type : UpcomingEventType { UpcomingEventType.astronomy_picture_of_the_day }
    let type:UpcomingEventType
}

// MARK: GenericUpcomingEvents
public enum GenericUpcomingEvents {
    public static func parse<T>(data: Data) -> UpcomingEvent<T>? {
        return try? ParadigmUtilities.json_decoder.decode(UpcomingEvent<T>.self, from: data)
    }
    public static func parse_any(data: Data) -> AnyUpcomingEvent? {
        do {
            let decoder:JSONDecoder = ParadigmUtilities.json_decoder
            let generic:UpcomingEventTypeCodable = try decoder.decode(UpcomingEventTypeCodable.self, from: data)
            switch generic.type {
            case .astronomy_picture_of_the_day:
                return try decoder.decode(UpcomingEvent<APODEvent>.self, from: data)
            case .earth_observatory_image_of_the_day:
                return try decoder.decode(UpcomingEvent<EarthObservatoryImageOfTheDayEvent>.self, from: data)
            case .joke_of_the_day:
                return try decoder.decode(UpcomingEvent<JOTDEvent>.self, from: data)
                
            case .movie:
                return try decoder.decode(UpcomingEvent<MovieEvent>.self, from: data)
            case .music_album:
                return try decoder.decode(UpcomingEvent<MusicAlbumEvent>.self, from: data)
            case .presentations:
                return try decoder.decode(UpcomingEvent<PresentationEvent>.self, from: data)
            case .science_year_review:
                return try decoder.decode(UpcomingEvent<ScienceYearReviewEvent>.self, from: data)
            case .sport_championships:
                return try decoder.decode(UpcomingEvent<SportChampionshipEvent>.self, from: data)
            case .sport_mlb:
                return try decoder.decode(UpcomingEvent<MLBEvent>.self, from: data)
            case .sport_professional_wrestling:
                return try decoder.decode(UpcomingEvent<ProfessionalWrestlingEvent>.self, from: data)
            case .sport_ufc:
                return try decoder.decode(UpcomingEvent<UFCEvent>.self, from: data)
                
            case .space_event:
                return try decoder.decode(UpcomingEvent<SpaceEvent>.self, from: data)
            case .space_lunar_eclipse:
                return try decoder.decode(UpcomingEvent<SpaceLunarEclipseEvent>.self, from: data)
            case .space_near_earth_object:
                return try decoder.decode(UpcomingEvent<SpaceNearEarthObjectEvent>.self, from: data)
            case .space_rocket_launch:
                return try decoder.decode(UpcomingEvent<SpaceRocketLaunchEvent>.self, from: data)
            
            case .spotify_new_music_friday:
                return try decoder.decode(UpcomingEvent<SpotifyNewMusicFridayEvent>.self, from: data)
            case .ticketmaster_music_event:
                return try decoder.decode(UpcomingEvent<TicketmasterMusicEvent>.self, from: data)
            case .video_game:
                return try decoder.decode(UpcomingEvent<VideoGameEvent>.self, from: data)
            case .video_game_events:
                return try decoder.decode(UpcomingEvent<VideoGameEventsEvent>.self, from: data)
            case .wikipedia_todays_featured_picture:
                return try decoder.decode(UpcomingEvent<WikipediaTodaysFeaturedPictureEvent>.self, from: data)
            case .word_of_the_day:
                return try decoder.decode(UpcomingEvent<WOTDEvent>.self, from: data)
                
            default:
                return nil
            }
        } catch {
            return nil
        }
    }
}