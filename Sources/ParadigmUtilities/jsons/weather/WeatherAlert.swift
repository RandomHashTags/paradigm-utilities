//
//  WeatherAlert.swift
//
//
//  Created by Evan Anderson on 7/1/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherAlert : Jsonable {
    public let event:String, certainty:String?, headline:String?, instruction:String?, description:String?
    public let zones:[WeatherZone]
    public let subdivisions:[SovereignStateSubdivisionWrapper]?
    public let defcon:Int
    public let time:WeatherAlertTime
    public let source:EventSource
    
    public init(event: String, certainty: String?, headline: String?, instruction: String?, description: String?, zones: [WeatherZone], subdivisions: [any SovereignStateSubdivision]?, defcon: Int, time: WeatherAlertTime, source: EventSource) {
        self.event = event
        self.certainty = certainty
        self.headline = headline
        self.instruction = instruction
        self.description = description
        self.zones = zones
        self.subdivisions = subdivisions?.map({ SovereignStateSubdivisionWrapper($0) })
        self.defcon = defcon
        self.time = time
        self.source = source
    }
    public init(preAlert: ServerWeatherPreAlert, zones: [WeatherZone], source: EventSource) {
        event = preAlert.event
        defcon = preAlert.defcon
        subdivisions = preAlert.subdivisions
        certainty = preAlert.certainty
        headline = preAlert.headline
        instruction = preAlert.instruction
        description = preAlert.description
        time = preAlert.time
        self.zones = zones
        self.source = source
    }
}
