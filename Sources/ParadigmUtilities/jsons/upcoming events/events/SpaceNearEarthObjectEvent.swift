//
//  SpaceNearEarthObjectEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpaceNearEarthObjectEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.space_near_earth_object
    public typealias JSONKeys = ValueKeys
    
    public let close_approach_epoch:Int64, potentially_hazardous:Bool?, estimated_diameter_max:Float, estimated_diameter_min:Float, relative_velocity:String
    
    public init(close_approach_epoch: Int64, potentially_hazardous: Bool?, estimated_diameter_max: Float, estimated_diameter_min: Float, relative_velocity: String) {
        self.close_approach_epoch = close_approach_epoch
        self.potentially_hazardous = potentially_hazardous
        self.estimated_diameter_max = estimated_diameter_max
        self.estimated_diameter_min = estimated_diameter_min
        self.relative_velocity = relative_velocity
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .close_approach_epoch: return close_approach_epoch
        case .potentially_hazardous: return potentially_hazardous
        case .estimated_diameter_max: return estimated_diameter_max
        case .estimated_diameter_min: return estimated_diameter_min
        case .relative_velocity: return relative_velocity
        }
    }
}

public extension SpaceNearEarthObjectEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case close_approach_epoch
        case potentially_hazardous
        case estimated_diameter_max
        case estimated_diameter_min
        case relative_velocity
        
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
}