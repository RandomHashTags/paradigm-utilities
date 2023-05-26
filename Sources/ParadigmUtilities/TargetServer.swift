//
//  TargetServer.swift
//  
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation

public enum TargetServer : String, CaseIterable {
    case countries
    case environment
    case feedback
    case government
    case health
    case history
    case news
    case premium
    case remote_notifications
    case science
    case stock_market
    case upcoming_events
    case weather
    
    public var name : String {
        switch self {
        case .countries:            return "Countries"
        case .environment:          return "Environment"
        case .feedback:             return "Feedback"
        case .government:           return "Government"
        case .health:               return "Health"
        case .history:              return "History"
        case .news:                 return "News"
        case .premium:              return "Premium"
        case .remote_notifications: return "Remote Notifications"
        case .science:              return "Science"
        case .stock_market:         return "Stock Market"
        case .upcoming_events:      return "Upcoming Events"
        case .weather:              return "Weather"
        }
    }
}
