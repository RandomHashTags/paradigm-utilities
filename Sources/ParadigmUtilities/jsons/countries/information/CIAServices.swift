//
//  CIAServices.swift
//  
//
//  Created by Evan Anderson on 10/25/22.
//

import Foundation

public struct CIAServices : SovereignStateInformationValue {
    public typealias ValueKeys = CIAServicesValueKeys
    
    public let countryURL:String?, summaryURL:String?, travelFactsURL:String?
    public var values:[CIAValue]
    public var sources:EventSources?
    
    public init(countryURL: String?, summaryURL: String?, travelFactsURL: String?, values: [CIAValue], sources: EventSources?) {
        self.countryURL = countryURL
        self.summaryURL = summaryURL
        self.travelFactsURL = travelFactsURL
        self.values = values
        self.sources = sources
    }
    
    public func getKeyValue(key: CIAServicesValueKeys) -> Any? {
        switch key {
        case .countryURL: return countryURL
        case .summaryURL: return summaryURL
        case .travelFactsURL: return travelFactsURL
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: CIAServicesValueKeys, value: T) {
        switch key {
        case .values:
            values = value as! [CIAValue]
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum CIAServicesValueKeys : String, JsonableValueKeys {
    case countryURL
    case summaryURL
    case travelFactsURL
    case values
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .values, .sources:
            return true
        default:
            return false
        }
    }
}
