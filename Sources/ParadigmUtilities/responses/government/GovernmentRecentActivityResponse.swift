//
//  GovernmentRecentActivityResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct GovernmentRecentActivityResponse : Jsonable {
    public typealias ValueKeys = GovernmentRecentActivityResponseValueKeys
    
    public var recent_activity:[GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]
    
    public init(recent_activity: [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]) {
        self.recent_activity = recent_activity
    }
    
    public func getKeyValue(key: GovernmentRecentActivityResponseValueKeys) -> Any? {
        switch key {
        case .recent_activity: return recent_activity
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentRecentActivityResponseValueKeys, value: T) {
        switch key {
        case .recent_activity:
            recent_activity = value as! [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]
            break
        }
    }
}

public enum GovernmentRecentActivityResponseValueKeys : String, JsonableValueKeys {
    case recent_activity
    
    public func isTranslatable() -> Bool {
        switch self {
        case .recent_activity:
            return true
        }
    }
}
