//
//  SovereignStateAvailabilities.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateAvailabilities : Jsonable {
    public let imageURLPrefix:String, availabilities:[ClientSovereignStateAvailability]
    
    public init(imageURLPrefix: String, availabilities: [ClientSovereignStateAvailability]) {
        self.imageURLPrefix = imageURLPrefix
        self.availabilities = availabilities
    }
}
