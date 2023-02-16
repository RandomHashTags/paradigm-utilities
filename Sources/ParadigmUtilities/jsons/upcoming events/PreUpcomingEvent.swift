//
//  PreUpcomingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct PreUpcomingEvent : UpcomingEventProtocol {
    public typealias ValueKeys = PreUpcomingEventValueKeys
    
    @CodableOmittable public var type:UpcomingEventType!
    public let id:String?
    @CodableOmittable public var event_date:EventDate?
    @CodableOmittable public var exact_start:Int64?
    @CodableOmittable public var exact_end:Int64?
    public var title:String, tag:String
    public var image_url:String?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var custom_type_singular_name:String?
    public let client_emoji:Icon?
    
    public let url:String?, production_companies:[String]?, popularity:Int?
    public var team_away:ClientMLBTeam?, team_home:ClientMLBTeam?
    
    public init(type: UpcomingEventType, id: String? = nil, event_date: EventDate?, exact_start: Int64? = nil, exact_end: Int64? = nil, title: String, tag: String, image_url: String?, countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, url: String? = nil, custom_type_singular_name: String? = nil, client_emoji: Icon? = nil, production_companies: [String]? = nil, popularity: Int? = nil, team_away: ClientMLBTeam? = nil, team_home: ClientMLBTeam? = nil) {
        self._type = CodableOmittable(type, omitted: true)
        self.id = id
        self._event_date = CodableOmittable(event_date, omitted: true)
        self._exact_start = CodableOmittable(exact_start, omitted: true)
        self._exact_end = CodableOmittable(exact_end, omitted: true)
        self.title = title
        self.tag = tag
        self.image_url = image_url
        self.countries = countries
        self.subdivisions = subdivisions
        self.custom_type_singular_name = custom_type_singular_name
        self.client_emoji = client_emoji
        self.url = url
        self.production_companies = production_companies
        self.popularity = popularity
        self.team_away = team_away
        self.team_home = team_home
    }
    
    public func getKeyValue(key: PreUpcomingEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .event_date: return event_date
        case .exact_start: return exact_start
        case .exact_end: return exact_end
        case .title: return title
        case .tag: return tag
        case .image_url: return image_url
        case .countries: return countries
        case .subdivisions: return subdivisions
        case .custom_type_singular_name: return custom_type_singular_name
        case .client_emoji: return client_emoji
        case .url: return url
        case .production_companies: return production_companies
        case .popularity: return popularity
        case .team_away: return team_away
        case .team_home: return team_home
        }
    }
    public mutating func setKeyValue<T>(key: PreUpcomingEventValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .tag:
            tag = value as! String
            break
        case .custom_type_singular_name:
            custom_type_singular_name = value as? String
            break
        case .team_away:
            team_away = value as? ClientMLBTeam
            break
        case .team_home:
            team_home = value as? ClientMLBTeam
            break
        default:
            break
        }
    }
}

public enum PreUpcomingEventValueKeys : String, JsonableValueKeys {
    case type
    case id
    case event_date
    case exact_start
    case exact_end
    case title
    case tag
    case image_url
    case countries
    case subdivisions
    case custom_type_singular_name
    case client_emoji
    case url
    case production_companies
    case popularity
    case team_away
    case team_home
    
    public var is_translatable : Bool {
        switch self {
        case .title, .tag, .custom_type_singular_name, .team_away, .team_home:
            return true
        default:
            return false
        }
    }
    public var is_omittable : Bool {
        switch self {
        case .type, .event_date, .exact_start, .exact_end:
            return true
        default:
            return false
        }
    }
}
