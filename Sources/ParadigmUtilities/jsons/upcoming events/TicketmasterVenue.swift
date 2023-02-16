//
//  TicketmasterVenue.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct TicketmasterVenue : Jsonable {
    public typealias ValueKeys = TicketmasterVenueValueKeys
    
    public let name:String, image_url:String?, country:Country, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?, location:Location?
    public var general_rule:String?, child_rule:String?, parking_detail:String?, accessible_seating_info:String?, url:String
    
    public init(name: String, image_url: String?, country: Country, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, location: Location?, general_rule: String?, child_rule: String?, parking_detail: String?, accessible_seating_info: String?, url: String) {
        self.name = name
        self.image_url = image_url
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.location = location
        self.general_rule = general_rule
        self.child_rule = child_rule
        self.parking_detail = parking_detail
        self.accessible_seating_info = accessible_seating_info
        self.url = url
    }
    
    public func getKeyValue(key: TicketmasterVenueValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .image_url: return image_url
        case .country: return country
        case .subdivision: return subdivision
        case .city: return city
        case .location: return location
        case .general_rule: return general_rule
        case .child_rule: return child_rule
        case .parking_detail: return parking_detail
        case .accessible_seating_info: return accessible_seating_info
        }
    }
    public mutating func setKeyValue<T>(key: TicketmasterVenueValueKeys, value: T) {
        switch key {
        case .general_rule:
            general_rule = value as? String
            break
        case .child_rule:
            child_rule = value as? String
            break
        case .parking_detail:
            parking_detail = value as? String
            break
        case .accessible_seating_info:
            accessible_seating_info = value as? String
            break
        default:
            break
        }
    }
}

public enum TicketmasterVenueValueKeys : String, JsonableValueKeys {
    case name
    case image_url
    case country
    case subdivision
    case city
    case location
    case general_rule
    case child_rule
    case parking_detail
    case accessible_seating_info
    
    public var is_translatable : Bool {
        switch self {
        case .general_rule, .child_rule, .parking_detail, .accessible_seating_info:
            return true
        default:
            return false
        }
    }
}
