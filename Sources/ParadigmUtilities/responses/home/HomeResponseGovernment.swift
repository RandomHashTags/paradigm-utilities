//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public final class HomeResponseGovernment : HomeResponseProtocol {
    public typealias TranslationKeys = HomeResponseGovernmentTranslationKeys
    
    public static func == (lhs: HomeResponseGovernment, rhs: HomeResponseGovernment) -> Bool {
        return lhs.recent_activity == rhs.recent_activity
    }
    
    public var recent_activity:[Country:[GovernmentRecentActivityResponse]]
    
    public init(recent_activity: [Country:[GovernmentRecentActivityResponse]]) {
        self.recent_activity = recent_activity
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(recent_activity)
    }
    
    public func getKeyValue(key: HomeResponseGovernmentTranslationKeys) -> Any? {
        switch key {
        case .recent_activity: return recent_activity
        }
    }
    public func setKeyValue<T>(key: HomeResponseGovernmentTranslationKeys, value: T) {
        switch key {
        case .recent_activity:
            recent_activity = value as! [Country:[GovernmentRecentActivityResponse]]
            break
        }
    }
}

public enum HomeResponseGovernmentTranslationKeys : String, JsonableTranslationKey {
    case recent_activity
}
