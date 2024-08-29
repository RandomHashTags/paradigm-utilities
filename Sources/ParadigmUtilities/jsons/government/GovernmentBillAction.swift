//
//  GovernmentBillAction.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct GovernmentBillAction : Jsonable {    
    public let chamber:GovernmentChamberWrapper?
    public var title:String
    public let time:TimeInterval
    
    public init(chamber: (any GovernmentChamber)?, title: String, time: TimeInterval) {
        self.chamber = chamber?.wrapped()
        self.title = title
        self.time = time
    }
}