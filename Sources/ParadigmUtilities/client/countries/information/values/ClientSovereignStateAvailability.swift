//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, primaryCategory:String, imageURL:String?, value:Bool
    
    public init(info: SovereignStateInfo, primaryCategory: String, imageURL: String?, value: Bool) {
        type = .availabilities
        self.info = info
        self.primaryCategory = primaryCategory
        self.imageURL = imageURL
        self.value = value
    }
}
