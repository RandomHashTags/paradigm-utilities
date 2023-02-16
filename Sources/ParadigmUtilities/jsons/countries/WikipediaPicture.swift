//
//  WikipediaPicture.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct WikipediaPicture : Jsonable {
    public typealias ValueKeys = WikipediaPictureValueKeys
    
    public let key:String
    public var name:String, title:String?
    public let image_url:String
    
    public init(key: String, name: String, title: String?, image_url: String) {
        self.key = key
        self.name = name
        self.title = title
        self.image_url = image_url
    }
    
    public var tag : String {
        return title ?? name
    }
    
    public func getKeyValue(key: WikipediaPictureValueKeys) -> Any? {
        switch key {
        case .key: return self.key
        case .name: return name
        case .title: return title
        case .image_url: return image_url
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaPictureValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        case .title:
            title = value as? String
            break
        default:
            break
        }
    }
}

public enum WikipediaPictureValueKeys : String, JsonableValueKeys {
    case key
    case name
    case title
    case image_url
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name, .title:
            return true
        default:
            return false
        }
    }
}
