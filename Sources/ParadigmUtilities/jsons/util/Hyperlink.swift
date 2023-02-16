//
//  Hyperlink.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

import Foundation

public struct Hyperlink : Jsonable {
    public typealias ValueKeys = HyperlinkValueKeys
    
    public var text:String
    public var url:String
    
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }
    
    public func getKeyValue(key: HyperlinkValueKeys) -> Any? {
        switch key {
        case .text: return text
        case .url: return url
        }
    }
    public mutating func setKeyValue<T>(key: HyperlinkValueKeys, value: T) {
        switch key {
        case .text:
            text = value as! String
            break
        default:
            break
        }
    }
}

public enum HyperlinkValueKeys : String, JsonableValueKeys {
    case text
    case url
    
    public var is_translatable : Bool {
        switch self {
        case .text:
            return true
        default:
            return false
        }
    }
}
