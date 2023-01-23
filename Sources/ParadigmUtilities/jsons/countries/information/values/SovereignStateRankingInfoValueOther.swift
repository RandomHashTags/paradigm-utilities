//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public typealias ValueKeys = SovereignStateRankingInfoValueOtherValueKeys
    
    public let value:Double?, value_type:NumberType
    public var description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, value_type: .integer, description: description, suffix: suffix)
    }
    public init(value: Float?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, value_type: .float, description: description, suffix: suffix)
    }
    public init(value: Double?, value_type: NumberType = .double, description: String, suffix: String?) {
        self.value = value
        self.value_type = value_type
        self.description = description
        self.suffix = suffix
    }
    
    public func getKeyValue(key: SovereignStateRankingInfoValueOtherValueKeys) -> Any? {
        switch key {
        case .value: return value
        case .value_type: return value_type
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
    case value_type
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
