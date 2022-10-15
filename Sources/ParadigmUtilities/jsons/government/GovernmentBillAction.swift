//
//  GovernmentBillAction.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct GovernmentBillAction : Jsonable {
    public let chamber:String?, title:String, time:TimeInterval
    
    public init(chamber: (any GovernmentChamber)?, title: String, time: TimeInterval) {
        self.chamber = chamber?.getIdentifier()
        self.title = title
        self.time = time
    }
}
