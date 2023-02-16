//
//  WeatherAlert.swift
//
//
//  Created by Evan Anderson on 7/1/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherAlert : Jsonable {
    public typealias ValueKeys = WeatherAlertValueKeys
    
    public var event:String, certainty:String?, headline:String?, instruction:String?, description:String
    public let zones:[WeatherZone]
    public let subdivisions:[SovereignStateSubdivisionWrapper]?
    public let defcon:Int
    public let time:WeatherAlertTime
    public var source:EventSource
    
    public init(event: String, certainty: String?, headline: String?, instruction: String?, description: String, zones: [WeatherZone], subdivisions: [any SovereignStateSubdivision]?, defcon: Int, time: WeatherAlertTime, source: EventSource) {
        self.event = event
        self.certainty = certainty
        self.headline = headline
        self.instruction = instruction
        self.description = description
        self.zones = zones
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.defcon = defcon
        self.time = time
        self.source = source
    }
    
    public func getKeyValue(key: WeatherAlertValueKeys) -> Any? {
        switch key {
        case .event: return event
        case .certainty: return certainty
        case .headline: return headline
        case .instruction: return instruction
        case .description: return description
        case .zones: return zones
        case .subdivisions: return subdivisions
        case .defcon: return defcon
        case .time: return time
        case .source: return source
        }
    }
    public mutating func setKeyValue<T>(key: WeatherAlertValueKeys, value: T) {
        switch key {
        case .event:
            event = value as! String
            break
        case .certainty:
            certainty = value as? String
            break
        case .headline:
            certainty = value as? String
            break
        case .instruction:
            instruction = value as? String
            break
        case .description:
            description = value as! String
            break
        case .source:
            source = value as! EventSource
            break
        default:
            break
        }
    }
}

public enum WeatherAlertValueKeys : String, JsonableValueKeys {
    case event
    case certainty
    case headline
    case instruction
    case description
    case zones
    case subdivisions
    case defcon
    case time
    case source
    
    public var is_translatable : Bool {
        switch self {
        case .event, .certainty, .headline, .instruction, .description, .source:
            return true
        default:
            return false
        }
    }
}
