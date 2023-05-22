//
//  SpaceNearEarthObjectEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct SpaceNearEarthObjectEvent : GenericUpcomingEvent {
    public typealias ValueKeys = SpaceNearEarthObjectEventValueKeys
    
    public var type : UpcomingEventType {
        return UpcomingEventType.space_near_earth_object
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
    public var youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let close_approach_epoch:Int64, potentially_hazardous:Bool?, estimated_diameter_max:Float, estimated_diameter_min:Float, relative_velocity:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, youtube_video_ids: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, close_approach_epoch: Int64, potentially_hazardous: Bool?, estimated_diameter_max: Float, estimated_diameter_min: Float, relative_velocity: String) {
        self.close_approach_epoch = close_approach_epoch
        self.potentially_hazardous = potentially_hazardous
        self.estimated_diameter_max = estimated_diameter_max
        self.estimated_diameter_min = estimated_diameter_min
        self.relative_velocity = relative_velocity
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.space_near_earth_object.image_url_prefix, imageURL.starts(with: prefix) {
            self.image_url = imageURL.substring(from: prefix.count)
        } else {
            self.image_url = image_url
        }
        self.youtube_video_ids = youtube_video_ids
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceNearEarthObjectEventValueKeys.self)
        close_approach_epoch = try container.decode(Int64.self, forKey: .close_approach_epoch)
        potentially_hazardous = try container.decodeIfPresent(Bool.self, forKey: .potentially_hazardous)
        estimated_diameter_max = try container.decode(Float.self, forKey: .estimated_diameter_max)
        estimated_diameter_min = try container.decode(Float.self, forKey: .estimated_diameter_min)
        relative_velocity = try container.decode(String.self, forKey: .relative_velocity)
        
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
        case .close_approach_epoch: return close_approach_epoch
        case .potentially_hazardous: return potentially_hazardous
        case .estimated_diameter_max: return estimated_diameter_max
        case .estimated_diameter_min: return estimated_diameter_min
        case .relative_velocity: return relative_velocity
        }
    }
    public mutating func setKeyValue<T>(key: ValueKeys, value: T) {
    }
}

public enum SpaceNearEarthObjectEventValueKeys : String, UpcomingEventValueKeys {
    case close_approach_epoch
    case potentially_hazardous
    case estimated_diameter_max
    case estimated_diameter_min
    case relative_velocity
    
    public var is_translatable : Bool {
        return false
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.near_earth_object
    }
    public var value_type : UpcomingEventValueType {
        switch self {
        case .close_approach_epoch:
            return UpcomingEventValueType.int64
        case .potentially_hazardous:
            return UpcomingEventValueType.boolean
        case .estimated_diameter_max, .estimated_diameter_min:
            return UpcomingEventValueType.float
        default:
            return UpcomingEventValueType.default_type
        }
    }
    public var value_type_unit : UpcomingEventValueTypeUnit? {
        switch self {
        case .estimated_diameter_max, .estimated_diameter_min:
            return UpcomingEventValueTypeUnit.meters
        default:
            return nil
        }
    }
    
    public var value_prefix : String? {
        switch self {
        case .relative_velocity: return "Relative Velocity: "
        default: return nil
        }
    }
}
