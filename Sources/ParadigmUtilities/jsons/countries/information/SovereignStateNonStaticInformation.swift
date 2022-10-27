//
//  SovereginStateNonStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateNonStaticInformation : SovereignStateInformationValue {
    public typealias TranslationKeys = SovereignStateNonStaticInformationTranslationKeys
    
    public var travel_advisories:[TravelAdvisory]?, sources:EventSources?
    
    public init(travel_advisories: [TravelAdvisory]?, sources: EventSources?) {
        self.travel_advisories = travel_advisories
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateNonStaticInformationTranslationKeys) -> Any? {
        switch key {
        case .travel_advisories: return travel_advisories
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateNonStaticInformationTranslationKeys, value: T) {
        switch key {
        case .travel_advisories:
            travel_advisories = value as? [TravelAdvisory]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateNonStaticInformationTranslationKeys : String, JsonableTranslationKey {
    case travel_advisories
    case sources
}
