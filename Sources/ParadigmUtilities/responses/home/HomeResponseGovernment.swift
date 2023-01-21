//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct HomeResponseGovernment : HomeResponseProtocol {
    public typealias ValueKeys = HomeResponseGovernmentValueKeys
    
    public var recent_activity:[Country:[GovernmentRecentActivityResponse]]
    
    public init(recent_activity: [Country:[GovernmentRecentActivityResponse]]) {
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
            recent_activity = value as! [Country:[GovernmentRecentActivityResponse]]
            break
        }
    }
}

public enum HomeResponseGovernmentValueKeys : String, JsonableValueKeys {
    case recent_activity
    
    public func isTranslatable() -> Bool {
        switch self {
        case .recent_activity:
            return true
        }
    }
}
