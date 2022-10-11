//
//  TicketmasterVenue.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct TicketmasterVenue : Jsonable {
    let name:String, imageURL:String?, countryCode:String, subdivisionName:String?, cityName:String, location:Location?, generalRule:String?, childRule:String?, parkingDetail:String?, accessibleSeatingInfo:String?, url:String
}
