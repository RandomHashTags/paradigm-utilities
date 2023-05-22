//
//  SpaceRocketLaunchEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct SpaceRocketLaunchEvent : GenericUpcomingEvent {
    public typealias ValueKeys = SpaceRocketLaunchEventValueKeys
    
    public var type : UpcomingEventType {
        return UpcomingEventType.space_rocket_launch
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
    public let youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let mission_name:String
    public var mission_description:String, mission_type:String
    public let window_start:Int64, window_end:Int64?, exact_day:Bool?, exact_time:Bool?
    public var status:String
    public let probability:String, video_url:String?
    
    public init(exact_start: Int64, exact_end: Int64, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, mission: SpaceRocketLaunchMission) {
        mission_name = mission.name
        mission_description = mission.description
        mission_type = mission.type
        window_start = mission.window_start
        window_end = mission.window_end
        exact_day = mission.exact_day
        exact_time = mission.exact_time
        status = mission.status
        probability = mission.probability
        video_url = mission.video_url
        
        self.event_date = nil
        self.exact_start = exact_start
        self.exact_end = exact_end
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.space_rocket_launch.image_url_prefix, imageURL.starts(with: prefix) {
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
    public mutating func setKeyValue<T>(key: ValueKeys, value: T) {
        switch key {
        case .mission_description:
            mission_description = value as! String
            break
        case .mission_type:
            mission_type = value as! String
            break
        default:
            break
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
    
    public var is_translatable: Bool {
        switch self {
        case .mission_description, .mission_type, .status:
            return true
        default:
            return false
        }
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.rocket_launch
    }
    
    public var value_type : UpcomingEventValueType {
        switch self {
        case .window_start, .window_end:
            return UpcomingEventValueType.timestamp
        case .probability:
            return UpcomingEventValueType.placeholder
        case .video_url:
            return UpcomingEventValueType.video_url
        default:
            return UpcomingEventValueType.default_type
        }
    }
    public var value_cell_type : UpcomingEventValueCellType {
        switch self {
        case .mission_name:
            return UpcomingEventValueCellType.label_header
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public var value_prefix : String? {
        switch self {
        case .mission_type: return "Type: "
        case .window_start: return "Window Start: "
        case .window_end: return "Window End: "
        case .exact_day: return "Exact Day: "
        case .exact_time: return "Exact Time: "
        default: return nil
        }
    }
    public var value_string : String? {
        switch self {
        case .status:
            return "%status%%probability%"
        default:
            return nil
        }
    }
}
