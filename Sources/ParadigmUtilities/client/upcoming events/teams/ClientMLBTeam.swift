//
//  ClientMLBTeam.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ClientMLBTeam : Jsonable {
    public typealias ValueKeys = ClientMLBTeamValueKeys
    
    public var name:String
    public let scheduleURL:String, logoURL:String, wikipediaURL:String
    
    public init(name: String, scheduleURL: String, logoURL: String, wikipediaURL: String) {
        self.name = name
        self.scheduleURL = scheduleURL
        self.logoURL = logoURL
        self.wikipediaURL = wikipediaURL
    }
    
    public func getKeyValue(key: ClientMLBTeamValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .scheduleURL: return scheduleURL
        case .logoURL: return logoURL
        case .wikipediaURL: return wikipediaURL
        }
    }
    public mutating func setKeyValue<T>(key: ClientMLBTeamValueKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        default:
            break
        }
    }
}

public enum ClientMLBTeamValueKeys : String, JsonableValueKeys {
    case name
    case scheduleURL
    case logoURL
    case wikipediaURL
    
    public func isTranslatable() -> Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
