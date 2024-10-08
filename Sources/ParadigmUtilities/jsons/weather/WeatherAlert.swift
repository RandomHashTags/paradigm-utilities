//
//  WeatherAlert.swift
//
//
//  Created by Evan Anderson on 7/1/22.
//

import SwiftSovereignStates

public struct WeatherAlert : Jsonable {    
    public var event:String, certainty:String?, headline:String?, instruction:String?, description:String
    public let zones:[WeatherZone]
    public let subdivisions:[SovereignStateSubdivisionWrapper]?
    public let defcon:Int
    public let time:WeatherAlertTime
    public var source:EventSource
    
    public init(event: String, certainty: String?, headline: String?, instruction: String?, description: String, zones: [WeatherZone], subdivisions: [any SovereignStateSubdivision]?, defcon: Int, time: WeatherAlertTime, source: EventSource) {
        self.event = event
        self.certainty = certainty
        self.headline = headline
        self.instruction = instruction
        self.description = description
        self.zones = zones
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.defcon = defcon
        self.time = time
        self.source = source
    }
}