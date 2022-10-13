//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, title:String, primaryCategory:String, imageURL:String?, value:Bool
    
    public init(info: SovereignStateInfo, title: String, primaryCategory: String, imageURL: String?, value: Bool) {
        type = .availabilities
        self.info = info
        self.title = title
        self.primaryCategory = primaryCategory
        self.imageURL = imageURL
        self.value = value
    }
}
