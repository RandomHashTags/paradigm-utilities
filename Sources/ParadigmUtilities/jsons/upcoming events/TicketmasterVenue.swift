//
//  TicketmasterVenue.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation
import SwiftSovereignStates

public struct TicketmasterVenue : Jsonable {    
    public let name:String, image_url:String?, country:Country, subdivision:SovereignStateSubdivisionWrapper?, city:SovereignStateCityWrapper?, location:Location?
    public var general_rule:String?, child_rule:String?, parking_detail:String?, accessible_seating_info:String?, url:String
    
    public init(name: String, image_url: String?, country: Country, subdivision: (any SovereignStateSubdivision)?, city: (any SovereignStateCity)?, location: Location?, general_rule: String?, child_rule: String?, parking_detail: String?, accessible_seating_info: String?, url: String) {
        self.name = name
        self.image_url = image_url
        self.country = country
        self.subdivision = subdivision?.wrapped()
        self.city = city?.wrapped()
        self.location = location
        self.general_rule = general_rule
        self.child_rule = child_rule
        self.parking_detail = parking_detail
        self.accessible_seating_info = accessible_seating_info
        self.url = url
    }
}