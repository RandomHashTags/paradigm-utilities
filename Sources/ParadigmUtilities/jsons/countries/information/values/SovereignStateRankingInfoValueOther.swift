//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public typealias JSONKeys = SovereignStateRankingInfoValueOtherValueKeys
    
    public let value:RoundedFloat?
    public var description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? RoundedFloat(value!) : nil, description: description, suffix: suffix)
    }
    public init(value: RoundedFloat?, description: String, suffix: String?) {
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

public enum SovereignStateRankingInfoValueOtherValueKeys : String, JsonableKeys {
    case value
    case description
    case suffix
}
