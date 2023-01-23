//
//  SpaceRocketLaunchMission.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct SpaceRocketLaunchMission : Jsonable {
    public typealias ValueKeys = SpaceRocketLaunchMissionValueKeys
    
    public var name:String, description:String, type:String
    public let window_start:Int64, window_end:Int64?, exact_day:Bool?, exact_time:Bool?
    public var status:String, probability:String
    public let video_url:String?
    
    public init(name: String, description: String, type: String, window_start: Int64, window_end: Int64?, exact_day: Bool, exact_time: Bool, status: String, probability: String, video_url: String?) {
        self.name = name
        self.description = description
        self.type = type
        self.window_start = window_start
        self.window_end = window_end
        self.exact_day = exact_day ? exact_day : nil
        self.exact_time = exact_time ? exact_time : nil
        self.status = status
        self.probability = probability
        self.video_url = video_url
    }
    
    public func getKeyValue(key: SpaceRocketLaunchMissionValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .description: return description
        case .type: return type
        case .window_start: return window_start
        case .window_end: return window_end
        case .exact_day: return exact_day
        case .exact_time: return exact_time
        case .status: return status
        case .probability: return probability
        case .video_url: return video_url
        }
    }
    public mutating func setKeyValue<T>(key: SpaceRocketLaunchMissionValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .description:
            description = value as! String
            break
        case .type:
            type = value as! String
            break
        case .status:
            status = value as! String
            break
        case .probability:
            probability = value as! String
            break
        default:
            break
        }
    }
}

public enum SpaceRocketLaunchMissionValueKeys : String, JsonableValueKeys {
    case name
    case description
    case type
    case window_start
    case window_end
    case exact_day
    case exact_time
    case status
    case probability
    case video_url
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .description, .type, .status, .probability:
            return true
        default:
            return false
        }
    }
}
