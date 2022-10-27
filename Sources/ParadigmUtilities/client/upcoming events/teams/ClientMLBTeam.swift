//
//  ClientMLBTeam.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ClientMLBTeam : Jsonable {
    public typealias TranslationKeys = ClientMLBTeamTranslationKeys
    
    public var name:String
    public let scheduleURL:String, logoURL:String, wikipediaURL:String
    
    public init(name: String, scheduleURL: String, logoURL: String, wikipediaURL: String) {
        self.name = name
        self.scheduleURL = scheduleURL
        self.logoURL = logoURL
        self.wikipediaURL = wikipediaURL
    }
    
    public func getKeyValue(key: ClientMLBTeamTranslationKeys) -> Any? {
        switch key {
        case .name: return name
        }
    }
    public mutating func setKeyValue<T>(key: ClientMLBTeamTranslationKeys, value: T) {
        switch key {
        case .name:
            name = value as! String
            break
        }
    }
}

public enum ClientMLBTeamTranslationKeys : String, JsonableTranslationKey {
    case name
}
