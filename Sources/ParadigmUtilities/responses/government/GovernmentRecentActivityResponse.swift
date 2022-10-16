//
//  GovernmentRecentActivityResponse.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct GovernmentRecentActivityResponse : Jsonable {
    public let recent_activity:[PreEnactedBill]
    
    public init(recent_activity: [PreEnactedBill]) {
        self.recent_activity = recent_activity
    }
}
