//
//  WeatherPreAlert.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct WeatherPreAlert : Jsonable {
    public let id:String, areas:[String], time:WeatherAlertTime
}
