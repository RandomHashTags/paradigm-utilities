//
//  SpaceRocketLaunchMission.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct SpaceRocketLaunchMission : Jsonable {
    public typealias TranslationKeys = SpaceRocketLaunchMissionTranslationKeys
    
    public var name:String, description:String, type:String
    public let windowStart:Int64, windowEnd:Int64?, exactDay:Bool?, exactTime:Bool?
    public var status:String, probability:String
    public let videoURL:String?
    
    public init(name: String, description: String, type: String, windowStart: Int64, windowEnd: Int64?, exactDay: Bool, exactTime: Bool, status: String, probability: String, videoURL: String?) {
        self.name = name
        self.description = description
        self.type = type
        self.windowStart = windowStart
        self.windowEnd = windowEnd
        self.exactDay = exactDay ? exactDay : nil
        self.exactTime = exactTime ? exactTime : nil
        self.status = status
        self.probability = probability
        self.videoURL = videoURL
    }
    
    public func getKeyValue(key: SpaceRocketLaunchMissionTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        case .description: return description
        case .type: return type
        case .status: return status
        case .probability: return probability
        }
    }
    public mutating func setKeyValue<T>(key: SpaceRocketLaunchMissionTranslationKeys, value: T) {
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
        }
    }
}

public enum SpaceRocketLaunchMissionTranslationKeys : String, JsonableTranslationKey {
    case name
    case description
    case type
    case status
    case probability
}
