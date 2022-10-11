//
//  GovernmentPreAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation
import SwiftSovereignStates

public struct GovernmentPreAdministrationBill {
    public let chamber:any GovernmentChamber, statuses:[any GovernmentBillStatusHistoryStatus], id:String, title:String, committees:String?, notes:String?, date:EventDate
}
