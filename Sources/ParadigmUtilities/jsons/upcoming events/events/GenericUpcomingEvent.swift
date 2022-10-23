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
    public static func == (lhs: GenericUpcomingEvent, rhs: GenericUpcomingEvent) -> Bool {
        return lhs.type == rhs.type && lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    
    public let type:UpcomingEventType, id:String?, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public let customTypeSingularName:String?
    
    public let title:String, tag:String?, description:String?, location:String?, imageURL:String?
    public var youtubeVideoIDs:[String]?
    public let sources:EventSources
    public let hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public init(type: UpcomingEventType, id: String? = nil, eventDate: EventDate!, exactStartMilliseconds: Int64! = nil, exactEndMilliseconds: Int64! = nil, customTypeSingularName: String? = nil, title: String, tag: String? = nil, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]? = nil, sources: EventSources, hyperlinks: Hyperlinks? = nil, countries: [Country]? = nil, subdivisions: [any SovereignStateSubdivision]? = nil) {
        self.type = type
        self.id = id
        self.eventDate = eventDate
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        self.customTypeSingularName = customTypeSingularName
        self.title = title
        self.tag = tag
        self.description = description
        self.location = location
        self.imageURL = imageURL
        self.youtubeVideoIDs = youtubeVideoIDs
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
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
        guard let keys:[any UpcomingEventCodingKeys] = type.getCodingKeys(), let codingKey:any UpcomingEventCodingKeys = keys.first(where: { $0.rawValue.elementsEqual(key) }) else { return nil }
        return getValue(codingKey)
    }
    public func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        return nil
    }
}
