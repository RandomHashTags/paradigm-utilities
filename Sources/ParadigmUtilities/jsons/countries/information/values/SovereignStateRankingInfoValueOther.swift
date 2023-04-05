//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public typealias ValueKeys = SovereignStateRankingInfoValueOtherValueKeys
    
    public let value:ExactFloat?
    public var description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? ExactFloat(value!) : nil, description: description, suffix: suffix)
    }
    public init(value: ExactFloat?, description: String, suffix: String?) {
        self.value = value
        self.description = description
        self.suffix = suffix
    }
    
    public func getKeyValue(key: SovereignStateRankingInfoValueOtherValueKeys) -> Any? {
        switch key {
        case .value: return value
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
    case description
    case suffix
    
    public var is_translatable : Bool {
        switch self {
        case .description, .suffix:
            return true
        default:
            return false
        }
    }
}
