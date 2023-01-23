//
//  TicketmasterMusicEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum TicketmasterMusicEventCodingKeys : String, UpcomingEventValueKeys {
    case accessibility
    case ageRestriction
    case healthCheckSummary
    case healthCheckDescription
    case pleaseNote
    case seatMapURL
    case ticketLimit
    case priceRangeCurrency
    case priceRangeMax
    case priceRangeMin
    case priceRangeString
    case venues
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .accessibility:
            return UpcomingEventValueCategory.ticketmaster_music_event_accessibility
        case .ageRestriction:
            return UpcomingEventValueCategory.ticketmaster_music_event_ageRestriction
        case .healthCheckSummary, .healthCheckDescription:
            return UpcomingEventValueCategory.ticketmaster_music_event_healthCheck
        case .pleaseNote:
            return UpcomingEventValueCategory.ticketmaster_music_event_pleaseNote
        case .venues:
            return UpcomingEventValueCategory.ticketmaster_venues
        default:
            return UpcomingEventValueCategory.ticketmaster_music_event
        }
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .seatMapURL:
            return UpcomingEventValueType.image
        case .priceRangeCurrency:
            return UpcomingEventValueType.currency_id
        case .priceRangeMax, .priceRangeMin:
            return UpcomingEventValueType.currency
        case .venues:
            return UpcomingEventValueType.ticketmaster_venues
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .venues:
            return UpcomingEventValueCellType.ticketmaster_venue
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public func getValuePrefix() -> String? {
        switch self {
        case .priceRangeString:
            return "Price Range: "
        default:
            return nil
        }
    }
    public func getValueString() -> String? {
        switch self {
        case .priceRangeString:
            return "$%priceRangeMin% - $%priceRangeMax% (%priceRangeCurrency%)"
        default:
            return nil
        }
    }
}

public final class TicketmasterMusicEvent : GenericUpcomingEvent {
    public let accessibility:String?, ageRestriction:String?, healthCheckSummary:String?, healthCheckDescription:String?, pleaseNote:String?, seatMapURL:String?, ticketLimit:String?, priceRangeCurrency:String?, priceRangeMax:Float?, priceRangeMin:Float?, priceRangeString:String?, venues:[TicketmasterVenue]?
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64!, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, accessibility: String?, ageRestriction: String?, healthCheckSummary: String?, healthCheckDescription: String?, pleaseNote: String?, seatMapURL: String?, ticketLimit: String?, priceRangeCurrency: String?, priceRangeMax: Float?, priceRangeMin: Float?, priceRangeString: String?, venues: [TicketmasterVenue]?) {
        self.accessibility = accessibility
        self.ageRestriction = ageRestriction
        self.healthCheckSummary = healthCheckSummary
        self.healthCheckDescription = healthCheckDescription
        self.pleaseNote = pleaseNote
        self.seatMapURL = seatMapURL
        self.ticketLimit = ticketLimit
        self.priceRangeCurrency = priceRangeCurrency
        self.priceRangeMax = priceRangeMax
        self.priceRangeMin = priceRangeMin
        self.priceRangeString = priceRangeString
        self.venues = venues
        super.init(type: UpcomingEventType.ticketmaster_music_event, event_date: nil, exact_start: exactStartMilliseconds, exact_end: exactEndMilliseconds, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: imageURL, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: TicketmasterMusicEventCodingKeys.self)
        accessibility = try container.decodeIfPresent(String.self, forKey: .accessibility)
        ageRestriction = try container.decodeIfPresent(String.self, forKey: .ageRestriction)
        healthCheckSummary = try container.decodeIfPresent(String.self, forKey: .healthCheckSummary)
        healthCheckDescription = try container.decodeIfPresent(String.self, forKey: .healthCheckDescription)
        pleaseNote = try container.decodeIfPresent(String.self, forKey: .pleaseNote)
        seatMapURL = try container.decodeIfPresent(String.self, forKey: .seatMapURL)
        ticketLimit = try container.decodeIfPresent(String.self, forKey: .ticketLimit)
        priceRangeCurrency = try container.decodeIfPresent(String.self, forKey: .priceRangeCurrency)
        priceRangeMax = try container.decodeIfPresent(Float.self, forKey: .priceRangeMax)
        priceRangeMin = try container.decodeIfPresent(Float.self, forKey: .priceRangeMin)
        priceRangeString = try container.decodeIfPresent(String.self, forKey: .priceRangeString)
        venues = try container.decodeIfPresent([TicketmasterVenue].self, forKey: .venues)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:TicketmasterMusicEventCodingKeys = key as? TicketmasterMusicEventCodingKeys else { return nil }
        switch key {
        case .accessibility: return accessibility
        case .ageRestriction: return ageRestriction
        case .healthCheckSummary: return healthCheckSummary
        case .healthCheckDescription: return healthCheckDescription
        case .pleaseNote: return pleaseNote
        case .seatMapURL: return seatMapURL
        case .ticketLimit: return ticketLimit
        case .priceRangeCurrency: return priceRangeCurrency
        case .priceRangeMax: return priceRangeMax
        case .priceRangeMin: return priceRangeMin
        case .priceRangeString: return priceRangeString
        case .venues: return venues
        }
    }
}
