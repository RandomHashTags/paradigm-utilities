//
//  SpaceLunarEclipseEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct SpaceLunarEclipseEvent : GenericUpcomingEvent {
    public typealias JSONKeys = SpaceLunarEclipseEventValueKeys
    
    public var type : UpcomingEventType? {
        return UpcomingEventType.space_lunar_eclipse
    }
    public let event_date:EventDate?, exact_start:Int64?, exact_end:Int64?
    public var custom_type_singular_name:String?
    
    public var title:String, description:String?
    public var location:String?
    public var image_url:String? {
        didSet {
            guard let imageURL:String = image_url, let prefix:String = type?.image_url_prefix, imageURL.starts(with: prefix) else { return }
            image_url = imageURL.substring(from: prefix.count)
        }
    }
    public var youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let time_greatest:Int64, orbital_node:String, saros:String, gamma:String, magnitude_penumbra:String, magnitude_umbra:String, duration_partial:Int, duration_total:Int
    
    public init(exact_start: Int64, exact_end: Int64, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, time_greatest: Int64, orbital_node: String, saros: String, gamma: String, magnitude_penumbra: String, magnitude_umbra: String, duration_partial: Int, duration_total: Int) {
        self.time_greatest = time_greatest
        self.orbital_node = orbital_node
        self.saros = saros
        self.gamma = gamma
        self.magnitude_penumbra = magnitude_penumbra
        self.magnitude_umbra = magnitude_umbra
        self.duration_partial = duration_partial
        self.duration_total = duration_total
        
        self.event_date = nil
        self.exact_start = exact_start
        self.exact_end = exact_end
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.space_lunar_eclipse.image_url_prefix, imageURL.starts(with: prefix) {
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
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceLunarEclipseEventValueKeys.self)
        time_greatest = try container.decode(Int64.self, forKey: .time_greatest)
        orbital_node = try container.decode(String.self, forKey: .orbital_node)
        saros = try container.decode(String.self, forKey: .saros)
        gamma = try container.decode(String.self, forKey: .gamma)
        magnitude_penumbra = try container.decode(String.self, forKey: .magnitude_penumbra)
        magnitude_umbra = try container.decode(String.self, forKey: .magnitude_umbra)
        duration_partial = try container.decode(Int.self, forKey: .duration_partial)
        duration_total = try container.decode(Int.self, forKey: .duration_total)
        
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
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .time_greatest: return time_greatest
        case .orbital_node: return orbital_node
        case .saros: return saros
        case .gamma: return gamma
        case .magnitude_penumbra: return magnitude_penumbra
        case .magnitude_umbra: return magnitude_umbra
        case .duration_partial: return duration_partial
        case .duration_total: return duration_total
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
    }
}

public enum SpaceLunarEclipseEventValueKeys : String, UpcomingEventValueKeys {
    case time_greatest
    case orbital_node
    case saros
    case gamma
    case magnitude_penumbra
    case magnitude_umbra
    case duration_partial
    case duration_total
    
    public var is_translatable : Bool {
        return false
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.space_lunar_eclipse
    }
    
    public var value_type : UpcomingEventValueType {
        switch self {
        case .time_greatest:
            return UpcomingEventValueType.timestamp
        case .duration_partial, .duration_total:
            return UpcomingEventValueType.int
        default:
            return UpcomingEventValueType.default_type
        }
    }
}
