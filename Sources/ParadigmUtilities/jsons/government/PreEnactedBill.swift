//
//  PreEnactedBill.swift
//
//
//  Created by Evan Anderson on 7/20/22.
//

public struct PreEnactedBill : Jsonable {    
    public let id:String
    public var title:String
    public let chamber:GovernmentChamberWrapper, status:GovernmentBillStatusWrapper
    
    public init(id: String, title: String, chamber: any GovernmentChamber, status: any GovernmentBillStatus) {
        self.id = id
        self.title = title
        self.chamber = chamber.wrapped()
        self.status = status.wrapped()
    }
}