//
//  GovernmentPrePolitician.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct GovernmentPrePolitician : Person {
    public let id:String, name:HumanName, party:PoliticalParty, imageURL:String?
    
    public init(id: String, name: HumanName, party: PoliticalParty, imageURL: String?) {
        self.id = id
        self.name = name
        self.party = party
        self.imageURL = imageURL
    }
}
