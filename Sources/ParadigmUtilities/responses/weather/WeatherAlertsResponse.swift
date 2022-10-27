//
//  WeatherAlertsResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherAlertsResponse : Jsonable {
    public typealias TranslationKeys = WeatherAlertsResponseTranslationKeys
    
    public var alerts:[WeatherEvent]?
    
    public init(alerts: [WeatherEvent]?) {
        self.alerts = alerts
    }
    
    public func getTranslationKeyValue(key: WeatherAlertsResponseTranslationKeys) -> Any? {
        switch key {
        case .alerts: return alerts
        }
    }
    public mutating func setTranslationKeyValue<T>(key: WeatherAlertsResponseTranslationKeys, value: T) {
        switch key {
        case .alerts:
            alerts = value as? [WeatherEvent]
            break
        }
    }
}

public enum WeatherAlertsResponseTranslationKeys : String, JsonableTranslationKey {
    case alerts
}
