//
//  TicketmasterVenue.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct TicketmasterVenue : Jsonable {
    public let name:String, imageURL:String?, country:Country, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?, location:Location?, generalRule:String?, childRule:String?, parkingDetail:String?, accessibleSeatingInfo:String?, url:String
    
    public init(name: String, imageURL: String?, country: Country, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, location: Location?, generalRule: String?, childRule: String?, parkingDetail: String?, accessibleSeatingInfo: String?, url: String) {
        self.name = name
        self.imageURL = imageURL
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.location = location
        self.generalRule = generalRule
        self.childRule = childRule
        self.parkingDetail = parkingDetail
        self.accessibleSeatingInfo = accessibleSeatingInfo
        self.url = url
    }
}
