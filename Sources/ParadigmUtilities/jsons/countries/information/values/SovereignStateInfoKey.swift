//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoKey : SovereignStateInformationValue {
    public typealias TranslationKeys = SovereignStateInfoKeyTranslationKeys
    
    public let info:SovereignStateInfo
    public var notes:String?
    public var yearOfData:Int
    public var values:[SovereignStateInfoValue], sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, yearOfData: Int, values: [SovereignStateInfoValue], sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.yearOfData = yearOfData
        self.values = values
        self.sources = sources
    }
    
    public func getTranslationKeyValue(key: SovereignStateInfoKeyTranslationKeys) -> Any? {
        switch key {
        case .notes: return notes
        case .values: return values
        case .sources: return sources
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateInfoKeyTranslationKeys, value: T) {
        switch key {
        case .notes:
            notes = value as? String
            break
        case .values:
            values = value as! [SovereignStateInfoValue]
            break
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SovereignStateInfoKeyTranslationKeys : String, JsonableTranslationKey {
    case notes
    case values
    case sources
}
