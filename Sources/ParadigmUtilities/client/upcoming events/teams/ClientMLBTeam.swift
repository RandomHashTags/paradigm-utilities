//
//  ClientMLBTeam.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

public struct ClientMLBTeam : Jsonable {    
    public var name:String
    public let schedule_url:String, logo_url:String, wikipedia_url:String
    
    public init(name: String, schedule_url: String, logo_url: String, wikipedia_url: String) {
        self.name = name
        self.schedule_url = schedule_url
        self.logo_url = logo_url
        self.wikipedia_url = wikipedia_url
    }
}