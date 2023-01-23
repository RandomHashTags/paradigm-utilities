//
//  SpaceRocketLaunchEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class SpaceRocketLaunchEvent : GenericUpcomingEvent {
    public let mission_name:String, mission_description:String, mission_type:String, window_start:Int64, window_end:Int64?, exact_day:Bool?, exact_time:Bool?, status:String, probability:String, video_url:String?
    
    public init(exact_start: Int64, exact_end: Int64, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, mission: SpaceRocketLaunchMission) {
        mission_name = mission.name
        mission_description = mission.description
        mission_type = mission.type
        window_start = mission.windowStart
        window_end = mission.windowEnd
        exact_day = mission.exactDay
        exact_time = mission.exactTime
        status = mission.status
        probability = mission.probability
        video_url = mission.videoURL
        super.init(type: UpcomingEventType.space_rocket_launch, event_date: nil, exact_start: exact_start, exact_end: exact_end, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceRocketLaunchEventValueKeys.self)
        mission_name = try container.decode(String.self, forKey: .mission_name)
        mission_description = try container.decode(String.self, forKey: .mission_description)
        mission_type = try container.decode(String.self, forKey: .mission_type)
        window_start = try container.decode(Int64.self, forKey: .window_start)
        window_end = try container.decodeIfPresent(Int64.self, forKey: .window_end)
        exact_day = try container.decodeIfPresent(Bool.self, forKey: .exact_day)
        exact_time = try container.decodeIfPresent(Bool.self, forKey: .exact_time)
        status = try container.decode(String.self, forKey: .status)
        probability = try container.decode(String.self, forKey: .probability)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpaceRocketLaunchEventValueKeys = key as? SpaceRocketLaunchEventValueKeys else { return nil }
        switch key {
        case .mission_name: return mission_name
        case .mission_description: return mission_description
        case .mission_type: return mission_type
        case .window_start: return window_start
        case .window_end: return window_end
        case .exact_day: return exact_day
        case .exact_time: return exact_time
        case .status: return status
        case .probability: return probability
        case .video_url: return video_url
        }
    }
}

public enum SpaceRocketLaunchEventValueKeys : String, UpcomingEventValueKeys {
    case mission_name
    case mission_description
    case mission_type
    case window_start
    case window_end
    case exact_day
    case exact_time
    case status
    case probability
    case video_url
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.rocket_launch
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .window_start, .window_end:
            return UpcomingEventValueType.timestamp
        case .probability:
            return UpcomingEventValueType.placeholder
        case .video_url:
            return UpcomingEventValueType.video_url
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .mission_name:
            return UpcomingEventValueCellType.label_header
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public func getValuePrefix() -> String? {
        switch self {
        case .mission_type: return "Type: "
        case .window_start: return "Window Start: "
        case .window_end: return "Window End: "
        case .exact_day: return "Exact Day: "
        case .exact_time: return "Exact Time: "
        default: return nil
        }
    }
    public func getValueString() -> String? {
        switch self {
        case .status:
            return "%status%%probability%"
        default:
            return nil
        }
    }
}
