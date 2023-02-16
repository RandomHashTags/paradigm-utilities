//
//  PreNationalPark.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNationalPark : SovereignStateInformationValue {
    public typealias ValueKeys = PreNationalParkValueKeys
    
    public let id:String
    public var name:String
    public let image_url:String?, country:Country
    public var sources:EventSources?
    
    public init(id: String, name: String, image_url: String?, country: Country) {
        self.id = id
        self.name = name
        self.image_url = image_url
        self.country = country
        sources = nil
    }
    
    public func getKeyValue(key: PreNationalParkValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .image_url: return image_url
        case .country: return country
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: PreNationalParkValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        default:
            break
        }
    }
}

public enum PreNationalParkValueKeys : String, JsonableValueKeys {
    case id
    case name
    case image_url
    case country
    case sources
    
    public var is_translatable : Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
