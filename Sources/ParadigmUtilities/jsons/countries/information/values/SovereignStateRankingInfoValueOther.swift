//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public typealias ValueKeys = SovereignStateRankingInfoValueOtherValueKeys
    
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
    
    public func getKeyValue(key: SovereignStateRankingInfoValueOtherValueKeys) -> Any? {
        switch key {
        case .value: return value
        case .valueType: return valueType
        case .description: return description
        case .suffix: return suffix
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateRankingInfoValueOtherValueKeys, value: T) {
        switch key {
        case .description:
            description = value as! String
            break
        case .suffix:
            suffix = value as? String
            break
        default:
            break
        }
    }
}

public enum SovereignStateRankingInfoValueOtherValueKeys : String, JsonableValueKeys {
    case value
    case valueType
    case description
    case suffix
    
    public func isTranslatable() -> Bool {
        switch self {
        case .description, .suffix:
            return true
        default:
            return false
        }
    }
}
