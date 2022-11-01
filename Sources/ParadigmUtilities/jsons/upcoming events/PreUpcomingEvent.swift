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
    
    public let type:UpcomingEventType, id:String?, eventDate:EventDate!, exactStartMilliseconds:Int64!, exactEndMilliseconds:Int64!
    public var title:String, tag:String
    public var imageURL:String?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var customTypeSingularName:String?
    public let clientEmoji:Icon?
    
    public let url:String?, productionCompanies:[String]?, popularity:Int?
    public var awayTeam:ClientMLBTeam?, homeTeam:ClientMLBTeam?
    
    public init(type: UpcomingEventType, id: String? = nil, eventDate: EventDate!, exactStartMilliseconds: Int64! = nil, exactEndMilliseconds: Int64! = nil, title: String, tag: String, imageURL: String?, countries: [Country]? = nil, subdivisions: [SovereignStateSubdivisionWrapper]? = nil, url: String? = nil, customTypeSingularName: String? = nil, clientEmoji: Icon? = nil, productionCompanies: [String]? = nil, popularity: Int? = nil, awayTeam: ClientMLBTeam? = nil, homeTeam: ClientMLBTeam? = nil) {
        self.type = type
        self.id = id
        self.eventDate = eventDate
        self.exactStartMilliseconds = exactStartMilliseconds
        self.exactEndMilliseconds = exactEndMilliseconds
        self.title = title
        self.tag = tag
        self.imageURL = imageURL
        self.countries = countries
        self.subdivisions = subdivisions
        self.customTypeSingularName = customTypeSingularName
        self.clientEmoji = clientEmoji
        self.url = url
        self.productionCompanies = productionCompanies
        self.popularity = popularity
        self.awayTeam = awayTeam
        self.homeTeam = homeTeam
    }
    
    public func getKeyValue(key: PreUpcomingEventValueKeys) -> Any? {
        switch key {
        case .type: return type
        case .id: return id
        case .eventDate: return eventDate
        case .exactStartMilliseconds: return exactStartMilliseconds
        case .exactEndMilliseconds: return exactEndMilliseconds
        case .title: return title
        case .tag: return tag
        case .imageURL: return imageURL
        case .countries: return countries
        case .subdivisions: return subdivisions
        case .customTypeSingularName: return customTypeSingularName
        case .clientEmoji: return clientEmoji
        case .url: return url
        case .productionCompanies: return productionCompanies
        case .popularity: return popularity
        case .awayTeam: return awayTeam
        case .homeTeam: return homeTeam
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
        case .customTypeSingularName:
            customTypeSingularName = value as? String
            break
        case .awayTeam:
            awayTeam = value as? ClientMLBTeam
            break
        case .homeTeam:
            homeTeam = value as? ClientMLBTeam
            break
        default:
            break
        }
    }
}

public enum PreUpcomingEventValueKeys : String, JsonableValueKeys {
    case type
    case id
    case eventDate
    case exactStartMilliseconds
    case exactEndMilliseconds
    case title
    case tag
    case imageURL
    case countries
    case subdivisions
    case customTypeSingularName
    case clientEmoji
    case url
    case productionCompanies
    case popularity
    case awayTeam
    case homeTeam
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title, .tag, .customTypeSingularName, .awayTeam, .homeTeam:
            return true
        default:
            return false
        }
    }
}
