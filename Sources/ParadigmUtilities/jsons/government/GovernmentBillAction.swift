//
//  GovernmentBillAction.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

struct GovernmentBillAction : Jsonable {
    let chamber:String?, title:String, time:TimeInterval
    
    init(chamber: (any GovernmentChamber)?, title: String, time: TimeInterval) {
        self.chamber = chamber?.rawValue
        self.title = title
        self.time = time
    }
}
