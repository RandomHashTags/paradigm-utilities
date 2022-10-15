//
//  WeatherAlertsResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct WeatherAlertsResponse : Jsonable {
    public let alerts:[WeatherEvent]?
    
    public init(alerts: [WeatherEvent]?) {
        self.alerts = alerts
    }
}
