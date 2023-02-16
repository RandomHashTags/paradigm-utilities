//
//  SpaceLunarEclipseEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class SpaceLunarEclipseEvent : GenericUpcomingEvent {
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
        super.init(type: UpcomingEventType.space_lunar_eclipse, event_date: nil, exact_start: exact_start, exact_end: exact_end, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceLunarEclipseEventValueKeys.self)
        time_greatest = try container.decode(Int64.self, forKey: .time_greatest)
        orbital_node = try container.decode(String.self, forKey: .orbital_node)
        saros = try container.decode(String.self, forKey: .saros)
        gamma = try container.decode(String.self, forKey: .gamma)
        magnitude_penumbra = try container.decode(String.self, forKey: .magnitude_penumbra)
        magnitude_umbra = try container.decode(String.self, forKey: .magnitude_umbra)
        duration_partial = try container.decode(Int.self, forKey: .duration_partial)
        duration_total = try container.decode(Int.self, forKey: .duration_total)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpaceLunarEclipseEventValueKeys = key as? SpaceLunarEclipseEventValueKeys else { return nil }
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
