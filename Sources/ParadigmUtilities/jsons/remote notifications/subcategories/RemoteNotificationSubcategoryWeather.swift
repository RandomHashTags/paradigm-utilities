//
//  RemoteNotificationSubcategoryWeather.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public enum RemoteNotificationSubcategoryWeather : String, CaseIterable, RemoteNotificationSubcategory {
    case local_alert
    
    public var category : RemoteNotificationCategory {
        return RemoteNotificationCategory.weather
    }
    
    public var name : String {
        switch self {
        case .local_alert: return "Local Alert"
        }
    }
    
    public var is_conditional : Bool {
        switch self {
        case .local_alert: return true
        }
    }
}
