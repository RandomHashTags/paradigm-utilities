//
//  WeatherAlertsResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherAlertsResponse : Jsonable {
    public typealias ValueKeys = WeatherAlertsResponseValueKeys
    
    public var alerts:[WeatherEvent]?
    
    public init(alerts: [WeatherEvent]?) {
        self.alerts = alerts
    }
    
    public func getKeyValue(key: WeatherAlertsResponseValueKeys) -> Any? {
        switch key {
        case .alerts: return alerts
        }
    }
    public mutating func setKeyValue<T>(key: WeatherAlertsResponseValueKeys, value: T) {
        switch key {
        case .alerts:
            alerts = value as? [WeatherEvent]
            break
        }
    }
}

public enum WeatherAlertsResponseValueKeys : String, JsonableValueKeys {
    case alerts
    
    public func isTranslatable() -> Bool {
        switch self {
        case .alerts:
            return true
        }
    }
}
