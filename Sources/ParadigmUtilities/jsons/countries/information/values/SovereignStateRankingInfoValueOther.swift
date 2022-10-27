//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public typealias TranslationKeys = SovereignStateRankingInfoValueOtherTranslationKeys
    
    public let value:Double?, valueType:NumberType
    public var description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, valueType: .integer, description: description, suffix: suffix)
    }
    public init(value: Float?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, valueType: .float, description: description, suffix: suffix)
    }
    public init(value: Double?, valueType: NumberType = .double, description: String, suffix: String?) {
        self.value = value
        self.valueType = valueType
        self.description = description
        self.suffix = suffix
    }
    
    public func getTranslationKeyValue(key: SovereignStateRankingInfoValueOtherTranslationKeys) -> Any? {
        switch key {
        case .description: return description
        case .suffix: return suffix
        }
    }
    public mutating func setTranslationKeyValue<T>(key: SovereignStateRankingInfoValueOtherTranslationKeys, value: T) {
        switch key {
        case .description:
            description = value as! String
            break
        case .suffix:
            suffix = value as? String
            break
        }
    }
}

public enum SovereignStateRankingInfoValueOtherTranslationKeys : String, JsonableTranslationKey {
    case description
    case suffix
}
