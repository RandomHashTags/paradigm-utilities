//
//  GovernmentPreAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import SwiftSovereignStates

public struct GovernmentPreAdministrationBill : Jsonable {    
    public let chamber:GovernmentChamberWrapper, statuses:[GovernmentBillStatusHistoryStatusWrapper], id:String
    public var title:String, committees:String?, notes:String?
    public let date:EventDate
    
    public init(chamber: any GovernmentChamber, statuses: [any GovernmentBillStatusHistoryStatus], id: String, title: String, committees: String?, notes: String?, date: EventDate) {
        self.chamber = chamber.wrapped()
        self.statuses = statuses.map({ $0.wrapped() })
        self.id = id
        self.title = title
        self.committees = committees
        self.notes = notes
        self.date = date
    }
}