//
//  SovereignStateAvailabilities.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

public struct SovereignStateAvailabilities : Jsonable {    
    public let image_url_prefix:String
    public var availabilities:[ClientSovereignStateAvailability]
    
    public init(image_url_prefix: String, availabilities: [ClientSovereignStateAvailability]) {
        self.image_url_prefix = image_url_prefix
        self.availabilities = availabilities
    }
}