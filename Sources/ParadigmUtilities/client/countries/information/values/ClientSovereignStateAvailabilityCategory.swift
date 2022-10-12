//
//  ClientSovereignStateAvailabilityCategory.swift
//
//
//  Created by Evan Anderson on 6/25/22.
//

import Foundation

public struct ClientSovereignStateAvailabilityCategory : Jsonable {
    public let id:String, name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
