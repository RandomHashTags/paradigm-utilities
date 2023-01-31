//
//  SpaceNearEarthObjectEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class SpaceNearEarthObjectEvent : GenericUpcomingEvent {
    public let close_approach_epoch:Int64, potentially_hazardous:Bool?, estimated_diameter_max:Float, estimated_diameter_min:Float, relative_velocity:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, youtube_video_ids: Set<String>?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, close_approach_epoch: Int64, potentially_hazardous: Bool?, estimated_diameter_max: Float, estimated_diameter_min: Float, relative_velocity: String) {
        self.close_approach_epoch = close_approach_epoch
        self.potentially_hazardous = potentially_hazardous
        self.estimated_diameter_max = estimated_diameter_max
        self.estimated_diameter_min = estimated_diameter_min
        self.relative_velocity = relative_velocity
        super.init(type: UpcomingEventType.space_near_earth_object, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: youtube_video_ids, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceNearEarthObjectEventValueKeys.self)
        close_approach_epoch = try container.decode(Int64.self, forKey: .close_approach_epoch)
        potentially_hazardous = try container.decodeIfPresent(Bool.self, forKey: .potentially_hazardous)
        estimated_diameter_max = try container.decode(Float.self, forKey: .estimated_diameter_max)
        estimated_diameter_min = try container.decode(Float.self, forKey: .estimated_diameter_min)
        relative_velocity = try container.decode(String.self, forKey: .relative_velocity)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpaceNearEarthObjectEventValueKeys = key as? SpaceNearEarthObjectEventValueKeys else { return nil }
        switch key {
        case .close_approach_epoch: return close_approach_epoch
        case .potentially_hazardous: return potentially_hazardous
        case .estimated_diameter_max: return estimated_diameter_max
        case .estimated_diameter_min: return estimated_diameter_min
        case .relative_velocity: return relative_velocity
        }
    }
}

public enum SpaceNearEarthObjectEventValueKeys : String, UpcomingEventValueKeys {
    case close_approach_epoch
    case potentially_hazardous
    case estimated_diameter_max
    case estimated_diameter_min
    case relative_velocity
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.near_earth_object
    }
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .close_approach_epoch:
            return UpcomingEventValueType.int64
        case .potentially_hazardous:
            return UpcomingEventValueType.boolean
        case .estimated_diameter_max, .estimated_diameter_min:
            return UpcomingEventValueType.float
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValueTypeUnit() -> UpcomingEventValueTypeUnit? {
        switch self {
        case .estimated_diameter_max, .estimated_diameter_min:
            return UpcomingEventValueTypeUnit.meters
        default:
            return nil
        }
    }
    
    public func getValuePrefix() -> String? {
        switch self {
        case .relative_velocity: return "Relative Velocity: "
        default: return nil
        }
    }
}
