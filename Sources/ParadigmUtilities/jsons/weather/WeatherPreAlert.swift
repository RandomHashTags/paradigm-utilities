//
//  WeatherPreAlert.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct WeatherPreAlert : Jsonable {
    let id:String, areas:[String], time:WeatherAlertTime
}
