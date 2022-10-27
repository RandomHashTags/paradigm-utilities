//
//  RemoteNotificationSubcategoryWeather.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public enum RemoteNotificationSubcategoryWeather : String, CaseIterable, RemoteNotificationSubcategory {
    public typealias TranslationKeys = NoTranslationKeys
    
    case local_alert
    
    public func getCategory() -> RemoteNotificationCategory {
        return RemoteNotificationCategory.weather
    }
    
    public func getName() -> String {
        switch self {
        case .local_alert: return "Local Alert"
        }
    }
    
    public func isConditional() -> Bool {
        switch self {
        case .local_alert: return true
        }
    }
}
