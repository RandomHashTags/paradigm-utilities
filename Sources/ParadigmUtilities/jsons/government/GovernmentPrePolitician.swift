//
//  GovernmentPrePolitician.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct GovernmentPrePolitician : Person {
    public typealias ValueKeys = GovernmentPrePoliticianValueKeys
    
    public let id:String, name:HumanName, party:PoliticalParty, imageURL:String?
    
    public init(id: String, name: HumanName, party: PoliticalParty, imageURL: String?) {
        self.id = id
        self.name = name
        self.party = party
        self.imageURL = imageURL
    }
    
    public func getKeyValue(key: GovernmentPrePoliticianValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .name: return name
        case .party: return party
        case .imageURL: return imageURL
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentPrePoliticianValueKeys, value: T) {
    }
}

public enum GovernmentPrePoliticianValueKeys : String, JsonableValueKeys {
    case id
    case name
    case party
    case imageURL
    
    public func isTranslatable() -> Bool {
        return false
    }
}
