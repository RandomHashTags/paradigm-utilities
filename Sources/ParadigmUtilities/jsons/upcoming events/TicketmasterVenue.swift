//
//  TicketmasterVenue.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct TicketmasterVenue : Jsonable {
    public let name:String, imageURL:String?, countryCode:String, subdivisionName:String?, cityName:String, location:Location?, generalRule:String?, childRule:String?, parkingDetail:String?, accessibleSeatingInfo:String?, url:String
    
    public init(name: String, imageURL: String?, countryCode: String, subdivisionName: String?, cityName: String, location: Location?, generalRule: String?, childRule: String?, parkingDetail: String?, accessibleSeatingInfo: String?, url: String) {
        self.name = name
        self.imageURL = imageURL
        self.countryCode = countryCode
        self.subdivisionName = subdivisionName
        self.cityName = cityName
        self.location = location
        self.generalRule = generalRule
        self.childRule = childRule
        self.parkingDetail = parkingDetail
        self.accessibleSeatingInfo = accessibleSeatingInfo
        self.url = url
    }
}
