//
//  CIAServices.swift
//  
//
//  Created by Evan Anderson on 10/25/22.
//

import Foundation

public struct CIAServices : SovereignStateInformationValue {
    public typealias ValueKeys = CIAServicesValueKeys
    
    public let country_url:String?, summary_url:String?, travel_facts_url:String?
    public var values:[CIAValue]
    public var sources:EventSources?
    
    public init(country_url: String?, summary_url: String?, travel_facts_url: String?, values: [CIAValue], sources: EventSources?) {
        self.country_url = country_url
        self.summary_url = summary_url
        self.travel_facts_url = travel_facts_url
        self.values = values
        self.sources = sources
    }
    
    public func getKeyValue(key: CIAServicesValueKeys) -> Any? {
        switch key {
        case .country_url: return country_url
        case .summary_url: return summary_url
        case .travel_facts_url: return travel_facts_url
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
    case country_url
    case summary_url
    case travel_facts_url
    case values
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .values, .sources:
            return true
        default:
            return false
        }
    }
}
