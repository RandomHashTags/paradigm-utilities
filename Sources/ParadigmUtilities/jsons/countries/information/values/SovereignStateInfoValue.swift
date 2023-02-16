//
//  SovereignStateInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoValue : Jsonable {
    public typealias ValueKeys = SovereignStateInfoValueValueKeys
    
    public var title:String, value:String, description:String?
    
    public init(title: String, value: String, description: String?) {
        self.title = title
        self.value = value
        self.description = description
    }
    
    public func getKeyValue(key: SovereignStateInfoValueValueKeys) -> Any? {
        switch key {
        case .title: return title
        case .value: return value
        case .description: return description
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateInfoValueValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .value:
            self.value = value as! String
            break
        case .description:
            description = value as? String
            break
        }
    }
}

public enum SovereignStateInfoValueValueKeys : String, JsonableValueKeys {
    case title
    case value
    case description
    
    public var is_translatable : Bool {
        switch self {
        case .title, .value, .description:
            return true
        }
    }
}
