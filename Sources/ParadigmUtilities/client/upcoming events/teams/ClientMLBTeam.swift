//
//  ClientMLBTeam.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ClientMLBTeam : Jsonable {
    public let name:String, scheduleURL:String, logoURL:String, wikipediaURL:String
    
    public init(name: String, scheduleURL: String, logoURL: String, wikipediaURL: String) {
        self.name = name
        self.scheduleURL = scheduleURL
        self.logoURL = logoURL
        self.wikipediaURL = wikipediaURL
    }
}
