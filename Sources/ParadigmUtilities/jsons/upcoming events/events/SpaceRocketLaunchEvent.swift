//
//  SpaceRocketLaunchEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpaceRocketLaunchEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let mission_name:String
    public var mission_description:String, mission_type:String
    public let window_start:Int64, window_end:Int64?, exact_day:Bool?, exact_time:Bool?
    public var status:String
    public let probability:String, video_url:String?
    
    public init(mission: SpaceRocketLaunchMission) {
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
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
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
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
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

public extension SpaceRocketLaunchEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
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
}