//
//  HomeResponseGovernment.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation
import SwiftSovereignStates

public struct HomeResponseGovernment : Jsonable {
    public var recent_activity:[Country:[GovernmentRecentActivityResponse]]
    
    public init(recent_activity: [Country:[GovernmentRecentActivityResponse]]) {
        self.recent_activity = recent_activity
    }
}
