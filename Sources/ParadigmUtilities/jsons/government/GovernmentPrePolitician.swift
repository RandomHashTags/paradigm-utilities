//
//  GovernmentPrePolitician.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

public struct GovernmentPrePolitician : Person {    
    public let id:String, name:HumanName, party:PoliticalParty, image_url:String?
    
    public init(id: String, name: HumanName, party: PoliticalParty, image_url: String?) {
        self.id = id
        self.name = name
        self.party = party
        self.image_url = image_url
    }
}