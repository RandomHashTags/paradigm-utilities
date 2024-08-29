//
//  SpaceLunarEclipseEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpaceLunarEclipseEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let time_greatest:Int64, orbital_node:String, saros:String, gamma:String, magnitude_penumbra:String, magnitude_umbra:String, duration_partial:Int, duration_total:Int
    
    public init(time_greatest: Int64, orbital_node: String, saros: String, gamma: String, magnitude_penumbra: String, magnitude_umbra: String, duration_partial: Int, duration_total: Int) {
        self.time_greatest = time_greatest
        self.orbital_node = orbital_node
        self.saros = saros
        self.gamma = gamma
        self.magnitude_penumbra = magnitude_penumbra
        self.magnitude_umbra = magnitude_umbra
        self.duration_partial = duration_partial
        self.duration_total = duration_total
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

public extension SpaceLunarEclipseEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
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
}