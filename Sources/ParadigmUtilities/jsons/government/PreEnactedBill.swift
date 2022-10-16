//
//  PreEnactedBill.swift
//
//
//  Created by Evan Anderson on 7/20/22.
//

import Foundation

public struct PreEnactedBill : Jsonable {
    public let id:String, title:String, chamber:String, status:String
    
    public init(id: String, title: String, chamber: any GovernmentChamber, status: any GovernmentBillStatus) {
        self.id = id
        self.title = title
        self.chamber = chamber.getIdentifier()
        self.status = status.getIdentifier()
    }
}
