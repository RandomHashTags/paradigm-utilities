//
//  WeatherAlertTime.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public struct WeatherAlertTime : Jsonable {
    let sent:Int64, effective:Int64, expires:Int64, ends:Int64?
    
    func isExpired() -> Bool {
        return Int64(Date().timeIntervalSince1970 * 1_000) >= expires
    }
    func isEnded() -> Bool {
        guard let ends:Int64 = ends else { return true }
        return Int64(Date().timeIntervalSince1970 * 1_000) >= ends
    }
}
