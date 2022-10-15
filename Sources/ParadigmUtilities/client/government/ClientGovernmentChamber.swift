//
//  ClientGovernmentChamber.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public struct ClientGovernmentChamber : GovernmentChamber {
    
    public let id:String, name:String
    
    public init(name: String) {
        id = name.lowercased().replacingOccurrences(of: " ", with: "_")
        self.name = name
    }
    
    public func getIdentifier() -> String {
        return id
    }
    
    public func getName() -> String {
        return name
    }
}
