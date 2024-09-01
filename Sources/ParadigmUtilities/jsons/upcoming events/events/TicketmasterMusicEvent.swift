//
//  TicketmasterMusicEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct TicketmasterMusicEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.ticketmaster_music_event
    public typealias JSONKeys = ValueKeys
    
    public var accessibility:String?, age_restriction:String?, health_check_summary:String?, health_check_description:String?, please_note:String?
    public let seat_map_url:String?
    public var ticket_limit:String?
    public let price_range_currency:String?, price_range_max:Float?, price_range_min:Float?, price_range_string:String?
    public var venues:[TicketmasterVenue]?
    
    public init(accessibility: String?, age_restriction: String?, health_check_summary: String?, health_check_description: String?, please_note: String?, seat_map_url: String?, ticket_limit: String?, price_range_currency: String?, price_range_max: Float?, price_range_min: Float?, price_range_string: String?, venues: [TicketmasterVenue]?) {
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
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
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

public extension TicketmasterMusicEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
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
}
