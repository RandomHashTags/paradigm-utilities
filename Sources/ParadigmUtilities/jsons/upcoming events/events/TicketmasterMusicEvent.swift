//
//  TicketmasterMusicEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct TicketmasterMusicEvent : GenericUpcomingEvent {
    public typealias ValueKeys = TicketmasterMusicEventValueKeys
    
    public var type : UpcomingEventType {
        return UpcomingEventType.ticketmaster_music_event
    }
    public let event_date:EventDate?, exact_start:Int64?, exact_end:Int64?
    public var custom_type_singular_name:String?
    
    public var title:String, description:String?
    public var location:String?
    public var image_url:String? {
        didSet {
            guard let imageURL:String = image_url, let prefix:String = type.image_url_prefix, imageURL.starts(with: prefix) else { return }
            image_url = imageURL.substring(from: prefix.count)
        }
    }
    public let youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public var accessibility:String?, age_restriction:String?, health_check_summary:String?, health_check_description:String?, please_note:String?
    public let seat_map_url:String?
    public var ticket_limit:String?
    public let price_range_currency:String?, price_range_max:Float?, price_range_min:Float?, price_range_string:String?
    public var venues:[TicketmasterVenue]?
    
    public init(exact_start: Int64, exact_end: Int64!, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, accessibility: String?, age_restriction: String?, health_check_summary: String?, health_check_description: String?, please_note: String?, seat_map_url: String?, ticket_limit: String?, price_range_currency: String?, price_range_max: Float?, price_range_min: Float?, price_range_string: String?, venues: [TicketmasterVenue]?) {
        self.accessibility = accessibility
        self.age_restriction = age_restriction
        self.health_check_summary = health_check_summary
        self.health_check_description = health_check_description
        self.please_note = please_note
        self.seat_map_url = seat_map_url
        self.ticket_limit = ticket_limit
        self.price_range_currency = price_range_currency
        self.price_range_max = price_range_max
        self.price_range_min = price_range_min
        self.price_range_string = price_range_string
        self.venues = venues
        
        self.event_date = nil
        self.exact_start = exact_start
        self.exact_end = exact_end
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.ticketmaster_music_event.image_url_prefix, imageURL.starts(with: prefix) {
            self.image_url = imageURL.substring(from: prefix.count)
        } else {
            self.image_url = image_url
        }
        self.youtube_video_ids = nil
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: TicketmasterMusicEventValueKeys.self)
        accessibility = try container.decodeIfPresent(String.self, forKey: .accessibility)
        age_restriction = try container.decodeIfPresent(String.self, forKey: .age_restriction)
        health_check_summary = try container.decodeIfPresent(String.self, forKey: .health_check_summary)
        health_check_description = try container.decodeIfPresent(String.self, forKey: .health_check_description)
        please_note = try container.decodeIfPresent(String.self, forKey: .please_note)
        seat_map_url = try container.decodeIfPresent(String.self, forKey: .seat_map_url)
        ticket_limit = try container.decodeIfPresent(String.self, forKey: .ticket_limit)
        price_range_currency = try container.decodeIfPresent(String.self, forKey: .price_range_currency)
        price_range_max = try container.decodeIfPresent(Float.self, forKey: .price_range_max)
        price_range_min = try container.decodeIfPresent(Float.self, forKey: .price_range_min)
        price_range_string = try container.decodeIfPresent(String.self, forKey: .price_range_string)
        venues = try container.decodeIfPresent([TicketmasterVenue].self, forKey: .venues)
        
        let generic_container:KeyedDecodingContainer = try decoder.container(keyedBy: GenericUpcomingEventValueKeys.self)
        event_date = try generic_container.decodeIfPresent(EventDate.self, forKey: .event_date)
        exact_start = try generic_container.decodeIfPresent(Int64.self, forKey: .exact_start)
        exact_end = try generic_container.decodeIfPresent(Int64.self, forKey: .exact_end)
        title = try generic_container.decode(String.self, forKey: .title)
        description = try generic_container.decodeIfPresent(String.self, forKey: .description)
        location = try generic_container.decodeIfPresent(String.self, forKey: .location)
        image_url = try generic_container.decodeIfPresent(String.self, forKey: .image_url)
        youtube_video_ids = try generic_container.decodeIfPresent([String].self, forKey: .youtube_video_ids)
        sources = try generic_container.decode(EventSources.self, forKey: .sources)
        hyperlinks = try generic_container.decodeIfPresent(Hyperlinks.self, forKey: .hyperlinks)
        countries = try generic_container.decodeIfPresent([Country].self, forKey: .countries)
        subdivisions = try generic_container.decodeIfPresent([String].self, forKey: .subdivisions)?.compactMap({ SovereignStateSubdivisions.valueOfCacheID($0)?.wrapped() })
    }
    
    public func getKeyValue(key: ValueKeys) -> Any? {
        switch key {
        case .accessibility: return accessibility
        case .age_restriction: return age_restriction
        case .health_check_summary: return health_check_summary
        case .health_check_description: return health_check_description
        case .please_note: return please_note
        case .seat_map_url: return seat_map_url
        case .ticket_limit: return ticket_limit
        case .price_range_currency: return price_range_currency
        case .price_range_max: return price_range_max
        case .price_range_min: return price_range_min
        case .price_range_string: return price_range_string
        case .venues: return venues
        }
    }
    public mutating func setKeyValue<T>(key: ValueKeys, value: T) {
        switch key {
        case .accessibility:
            accessibility = value as? String
            break
        case .age_restriction:
            age_restriction = value as? String
            break
        case .health_check_summary:
            health_check_summary = value as? String
            break
        case .health_check_description:
            health_check_description = value as? String
            break
        case .ticket_limit:
            ticket_limit = value as? String
            break
        case .venues:
            venues = value as? [TicketmasterVenue]
            break
        default:
            break
        }
    }
}

public enum TicketmasterMusicEventValueKeys : String, UpcomingEventValueKeys {
    case accessibility
    case age_restriction
    case health_check_summary
    case health_check_description
    case please_note
    case seat_map_url
    case ticket_limit
    case price_range_currency
    case price_range_max
    case price_range_min
    case price_range_string
    case venues
    
    public var is_translatable: Bool {
        switch self {
        case .accessibility,
                .age_restriction,
                .health_check_summary,
                .health_check_description,
                .please_note,
                .ticket_limit,
                .venues:
            return true
        default:
            return false
        }
    }
    
    public var category : UpcomingEventValueCategory {
        switch self {
        case .accessibility:
            return UpcomingEventValueCategory.ticketmaster_music_event_accessibility
        case .age_restriction:
            return UpcomingEventValueCategory.ticketmaster_music_event_ageRestriction
        case .health_check_summary, .health_check_description:
            return UpcomingEventValueCategory.ticketmaster_music_event_healthCheck
        case .please_note:
            return UpcomingEventValueCategory.ticketmaster_music_event_pleaseNote
        case .venues:
            return UpcomingEventValueCategory.ticketmaster_venues
        default:
            return UpcomingEventValueCategory.ticketmaster_music_event
        }
    }
    
    public var value_type : UpcomingEventValueType {
        switch self {
        case .seat_map_url:
            return UpcomingEventValueType.image
        case .price_range_currency:
            return UpcomingEventValueType.currency_id
        case .price_range_max, .price_range_min:
            return UpcomingEventValueType.currency
        case .venues:
            return UpcomingEventValueType.ticketmaster_venues
        default:
            return UpcomingEventValueType.default_type
        }
    }
    public var value_cell_type : UpcomingEventValueCellType {
        switch self {
        case .venues:
            return UpcomingEventValueCellType.ticketmaster_venue
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public var value_prefix : String? {
        switch self {
        case .price_range_string:
            return "Price Range: "
        default:
            return nil
        }
    }
    public var value_string : String? {
        switch self {
        case .price_range_string:
            return "$%price_range_min% - $%price_range_max% (%price_range_currency%)"
        default:
            return nil
        }
    }
}
