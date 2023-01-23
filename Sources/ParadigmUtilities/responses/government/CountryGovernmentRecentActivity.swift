//
//  CountryGovernmentRecentActivity.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation
import SwiftSovereignStates

public struct CountryGovernmentRecentActivity : Jsonable {
    public typealias ValueKeys = CountryGovernmentRecentActivityValueKeys
    
    public let country:Country
    public var activity:[GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]] // TODO: fix invalid JSON when encoded | how to format?
    
    public init(country: Country, activity: [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]) {
        self.country = country
        self.activity = activity
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityValueKeys) -> Any? {
        switch key {
        case .activity: return activity
        }
    }
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityValueKeys, value: T) {
        switch key {
        case .activity:
            activity = value as! [GovernmentBillStatusWrapper:[EventDate:[GovernmentPreAdministrationBill]]]
            break
        }
    }
}

public enum CountryGovernmentRecentActivityValueKeys : String, JsonableValueKeys {
    case activity
    
    public func isTranslatable() -> Bool {
        switch self {
        case .activity:
            return true
        }
    }
}
