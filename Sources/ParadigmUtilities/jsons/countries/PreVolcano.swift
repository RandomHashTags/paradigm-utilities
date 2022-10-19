//
//  PreVolcano.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct PreVolcano : SovereignStateInformationValue {
    public let id:String, name:String, imageURL:String?, country:Country, sources:EventSources?
    
    public init(id: String, name: String, imageURL: String?, country: Country) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
        sources = nil
    }
}
