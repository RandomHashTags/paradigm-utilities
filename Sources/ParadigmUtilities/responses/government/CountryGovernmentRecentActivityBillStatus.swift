//
//  CountryGovernmentRecentActivityBillStatus.swift
//  
//
//  Created by Evan Anderson on 1/24/23.
//

import Foundation

public struct CountryGovernmentRecentActivityBillStatus : Jsonable {
    public typealias ValueKeys = CountryGovernmentRecentActivityBillStatusValueKeys
    
    public let status:GovernmentBillStatusWrapper
    public var dates:[CountryGovernmentRecentActivityDate]
    
    public init(status: (any GovernmentBillStatus), dates: [CountryGovernmentRecentActivityDate]) {
        self.status = status.wrapped()
        self.dates = dates
    }
    
    public func getKeyValue(key: CountryGovernmentRecentActivityBillStatusValueKeys) -> Any? {
        switch key {
        case .status: return status
        case .dates: return dates
        }
    }
    
    public mutating func setKeyValue<T>(key: CountryGovernmentRecentActivityBillStatusValueKeys, value: T) {
        switch key {
        case .dates:
            dates = value as! [CountryGovernmentRecentActivityDate]
            break
        default:
            break
        }
    }
}

public enum CountryGovernmentRecentActivityBillStatusValueKeys : String, JsonableValueKeys {
    case status
    case dates
    
    public func isTranslatable() -> Bool {
        switch self {
        case .dates:
            return true
        default:
            return false
        }
    }
}