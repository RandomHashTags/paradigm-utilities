//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public final class HomeResponseGovernment : Jsonable {
    public static func == (lhs: HomeResponseGovernment, rhs: HomeResponseGovernment) -> Bool {
        return lhs.recent_activity == rhs.recent_activity
    }
    
    public var recent_activity:[Country:[GovernmentRecentActivityResponse]]
    
    public init(recent_activity: [Country:[GovernmentRecentActivityResponse]]) {
        self.recent_activity = recent_activity
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(recent_activity)
    }
}
