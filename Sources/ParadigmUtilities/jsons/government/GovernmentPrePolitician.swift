//
//  GovernmentPrePolitician.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct GovernmentPrePolitician : Jsonable {
    let id:String, name:HumanName, party:PoliticalParty, imageURL:String?
}
