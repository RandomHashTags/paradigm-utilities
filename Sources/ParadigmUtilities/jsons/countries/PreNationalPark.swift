//
//  PreNationalPark.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNationalPark : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, id:String, name:String, imageURL:String?, country:Country
    
    public init(id: String, name: String, imageURL: String?, country: Country) {
        type = .national
        info = .national_parks
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
    }
}
