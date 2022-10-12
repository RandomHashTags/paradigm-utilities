//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct ClientSovereignStateAvailability : SovereignStateInformationValueProtocol {
    public let title:String, primaryCategory:String, imageURL:String?, value:Bool
    
    public init(title: String, primaryCategory: String, imageURL: String?, value: Bool) {
        self.title = title
        self.primaryCategory = primaryCategory
        self.imageURL = imageURL
        self.value = value
    }
}
