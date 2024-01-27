//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct HomeResponseGovernment : HomeResponseProtocol {
    public typealias JSONKeys = HomeResponseGovernmentValueKeys
    
    public var recent_activity:[CountryGovernmentRecentActivity]
    
    public init(recent_activity: [CountryGovernmentRecentActivity]) {
        self.recent_activity = recent_activity
    }
    
    public func getKeyValue(key: HomeResponseGovernmentValueKeys) -> Any? {
        switch key {
        case .recent_activity: return recent_activity
        }
    }
    public mutating func setKeyValue<T>(key: HomeResponseGovernmentValueKeys, value: T) {
        switch key {
        case .recent_activity:
            recent_activity = value as! [CountryGovernmentRecentActivity]
            break
        }
    }
}

public enum HomeResponseGovernmentValueKeys : String, JsonableKeys {
    case recent_activity
    
    public var is_translatable : Bool {
        switch self {
        case .recent_activity:
            return true
        }
    }
}
