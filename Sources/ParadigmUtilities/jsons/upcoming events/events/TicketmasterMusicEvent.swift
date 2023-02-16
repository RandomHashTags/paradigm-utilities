//
//  TicketmasterMusicEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class TicketmasterMusicEvent : GenericUpcomingEvent {
    public let accessibility:String?, age_restriction:String?, health_check_summary:String?, health_check_description:String?, please_note:String?, seat_map_url:String?, ticket_limit:String?, price_range_currency:String?, price_range_max:Float?, price_range_min:Float?, price_range_string:String?, venues:[TicketmasterVenue]?
    
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
        super.init(type: UpcomingEventType.ticketmaster_music_event, event_date: nil, exact_start: exact_start, exact_end: exact_end, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
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
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:TicketmasterMusicEventValueKeys = key as? TicketmasterMusicEventValueKeys else { return nil }
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
            return UpcomingEventValueType.defaultType()
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
