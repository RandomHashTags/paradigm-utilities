//
//  PreNationalPark.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct PreNationalPark : Jsonable {
    public let id:String, name:String, imageURL:String?, country:Country
    
    public init(id: String, name: String, imageURL: String?, country: Country) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.country = country
    }
}
