//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public extension HomeResponse {
    struct Government : HomeResponseProtocol {        
        public var recent_activity:[CountryGovernmentRecentActivity]
        
        public init(recent_activity: [CountryGovernmentRecentActivity]) {
            self.recent_activity = recent_activity
        }
    }
}