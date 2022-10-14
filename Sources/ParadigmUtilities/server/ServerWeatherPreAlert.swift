//
//  ServerWeatherPreAlert.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation
import SwiftSovereignStates

public struct ServerWeatherPreAlert : Jsonable {
    public let defcon:Int, event:String, id:String, country:Country, subdivisions:[SovereignStateSubdivisionWrapper], certainty:String?, headline:String?, instruction:String?, description:String?, zones:[WeatherZone], time:WeatherAlertTime
    
    public init(defcon: Int, event: String, id: String, country: Country, subdivisions: [any SovereignStateSubdivision], certainty: String?, headline: String?, instruction: String?, description: String?, zones: [WeatherZone], time: WeatherAlertTime) {
        self.defcon = defcon
        self.event = event
        self.id = id
        self.country = country
        self.subdivisions = subdivisions.map({ SovereignStateSubdivisionWrapper($0) })
        self.certainty = certainty
        self.headline = headline
        self.instruction = instruction
        self.description = description
        self.zones = zones
        self.time = time
    }
    
    public func onlyWithSubdivision(_ subdivision: any SovereignStateSubdivision) -> ServerWeatherPreAlert {
        var subdivisionZones:[WeatherZone] = [WeatherZone](zones)
        subdivisionZones.removeAll(where: { !subdivision.isEqual($0.subdivision) })
        return ServerWeatherPreAlert(defcon: defcon, event: event, id: id, country: country, subdivisions: [subdivision], certainty: nil, headline: nil, instruction: nil, description: nil, zones: subdivisionZones, time: time)
    }
    
    public func toClientJsonable() -> WeatherPreAlert {
        return WeatherPreAlert(id: id, areas: zones.map({ $0.name }), time: time, country: country)
    }
}
