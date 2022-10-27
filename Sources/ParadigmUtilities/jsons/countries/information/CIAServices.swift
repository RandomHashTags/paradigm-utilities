//
//  CIAServices.swift
//  
//
//  Created by Evan Anderson on 10/25/22.
//

import Foundation

public struct CIAServices : SovereignStateInformationValue {
    public typealias TranslationKeys = CIAServicesTranslationKeys
    
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
    
    public func getKeyValue(key: CIAServicesTranslationKeys) -> Any? {
        switch key {
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: CIAServicesTranslationKeys, value: T) {
        switch key {
        case .values:
            values = value as! [CIAValue]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum CIAServicesTranslationKeys : String, JsonableTranslationKey {
    case values
    case sources
}
