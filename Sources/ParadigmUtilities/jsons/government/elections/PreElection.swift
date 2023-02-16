//
//  PreElection.swift
//  
//
//  Created by Evan Anderson on 10/31/22.
//

import Foundation
import SwiftSovereignStates

public struct PreElection : Jsonable {
    public typealias ValueKeys = PreElectionValueKeys
    
    public let id:String
    public var name:String
    public let date:EventDate, country:Country
    
    public init(id: String, name: String, date: EventDate, country: Country) {
        self.id = id
        self.name = name
        self.date = date
        self.country = country
    }
    
    public func getKeyValue(key: PreElectionValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .date: return date
        case .country: return country
        }
    }
    public mutating func setKeyValue<T>(key: PreElectionValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        default:
            break
        }
    }
}

public enum PreElectionValueKeys : String, JsonableValueKeys {
    case id
    case name
    case date
    case country
    
    public var is_translatable : Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
