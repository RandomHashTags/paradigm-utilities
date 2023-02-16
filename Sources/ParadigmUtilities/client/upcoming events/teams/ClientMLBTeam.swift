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
    public let schedule_url:String, logo_url:String, wikipedia_url:String
    
    public init(name: String, schedule_url: String, logo_url: String, wikipedia_url: String) {
        self.name = name
        self.schedule_url = schedule_url
        self.logo_url = logo_url
        self.wikipedia_url = wikipedia_url
    }
    
    public func getKeyValue(key: ClientMLBTeamValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .schedule_url: return schedule_url
        case .logo_url: return logo_url
        case .wikipedia_url: return wikipedia_url
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
    case schedule_url
    case logo_url
    case wikipedia_url
    
    public var is_translatable : Bool {
        switch self {
        case .name:
            return true
        default:
            return false
        }
    }
}
