//
//  GovernmentRecentActivityResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct GovernmentRecentActivityResponse : Jsonable {
    public typealias TranslationKeys = GovernmentRecentActivityResponseTranslationKeys
    
    public var recent_activity:[GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]
    
    public init(recent_activity: [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]) {
        self.recent_activity = recent_activity
    }
    
    public func getTranslationKeyValue(key: GovernmentRecentActivityResponseTranslationKeys) -> Any? {
        switch key {
        case .recent_activity: return recent_activity
        }
    }
    public mutating func setTranslationKeyValue<T>(key: GovernmentRecentActivityResponseTranslationKeys, value: T) {
        switch key {
        case .recent_activity:
            recent_activity = value as! [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]
            break
        }
    }
}

public enum GovernmentRecentActivityResponseTranslationKeys : String, JsonableTranslationKey {
    case recent_activity
}
