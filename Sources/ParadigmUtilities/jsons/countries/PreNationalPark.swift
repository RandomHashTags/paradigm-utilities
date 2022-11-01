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
    public let imageURL:String?, country:Country
    public var sources:EventSources?
    
    public init(id: String, name: String, imageURL: String?, country: Country) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
        sources = nil
    }
    
    public func getKeyValue(key: PreNationalParkValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .imageURL: return imageURL
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
    case imageURL
    case country
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
