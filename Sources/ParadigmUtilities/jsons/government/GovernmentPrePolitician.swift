//
//  GovernmentPrePolitician.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct GovernmentPrePolitician : Person {
    public typealias JSONKeys = GovernmentPrePoliticianValueKeys
    
    public let id:String, name:HumanName, party:PoliticalParty, image_url:String?
    
    public init(id: String, name: HumanName, party: PoliticalParty, image_url: String?) {
        self.id = id
        self.name = name
        self.party = party
        self.image_url = image_url
    }
    
    public func getKeyValue(key: GovernmentPrePoliticianValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .party: return party
        case .image_url: return image_url
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentPrePoliticianValueKeys, value: T) {
    }
}

public enum GovernmentPrePoliticianValueKeys : String, JsonableKeys {
    case id
    case name
    case party
    case image_url
}
