//
//  WeatherAlertTime.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherAlertTime : Jsonable {
    public let sent:Date, effective:Date, expires:Date, ends:Date?
    
    public init(sent: Date, effective: Date, expires: Date, ends: Date?) {
        self.sent = sent
        self.effective = effective
        self.expires = expires
        self.ends = ends
    }
    
    public var is_expired : Bool {
        return ParadigmUtilities.now >= expires
    }
    public var is_ended : Bool {
        guard let ends:Date = ends else { return true }
        return ParadigmUtilities.now >= ends
    }
}
