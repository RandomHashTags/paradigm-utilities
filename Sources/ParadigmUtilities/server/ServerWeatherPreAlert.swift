//
//  ServerWeatherPreAlert.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct ServerWeatherPreAlert : Jsonable {
    public let defcon:Int, event:String, id:String, subdivisions:[String], certainty:String?, headline:String?, instruction:String?, description:String?, zones:[WeatherZone], time:WeatherAlertTime
    
    public init(defcon: Int, event: String, id: String, subdivisions: [String], certainty: String?, headline: String?, instruction: String?, description: String?, zones: [WeatherZone], time: WeatherAlertTime) {
        self.defcon = defcon
        self.event = event
        self.id = id
        self.subdivisions = subdivisions
        self.certainty = certainty
        self.headline = headline
        self.instruction = instruction
        self.description = description
        self.zones = zones
        self.time = time
    }
    
    public func onlyWithSubdivision(_ subdivision: String) -> ServerWeatherPreAlert {
        var subdivisionZones:[WeatherZone] = [WeatherZone](zones)
        subdivisionZones.removeAll(where: { $0.subdivision.compare(subdivision) != .orderedSame })
        return ServerWeatherPreAlert(defcon: defcon, event: event, id: id, subdivisions: [subdivision], certainty: nil, headline: nil, instruction: nil, description: nil, zones: subdivisionZones, time: time)
    }
    
    public func toClientJsonable() -> WeatherPreAlert {
        return WeatherPreAlert(id: id, areas: zones.map({ $0.name }), time: time)
    }
}
