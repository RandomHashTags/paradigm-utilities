//
//  GovernmentAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation

public struct GovernmentAdministrationBill : Jsonable {
    public let title:String, sponsor:GovernmentPrePolitician?, summary:String?, policyArea:String?, subjects:[String]?, cosponsors:[GovernmentPrePolitician]?, actions:[GovernmentBillAction]?, sources:EventSources
    
    public init(title: String, sponsor: GovernmentPrePolitician?, summary: String?, policyArea: (any GovernmentPolicyArea)?, subjects: [String]?, cosponsors: [GovernmentPrePolitician]?, actions: [GovernmentBillAction]?, sources: EventSources) {
        self.title = title
        self.sponsor = sponsor
        self.summary = summary
        self.policyArea = policyArea?.rawValue
        self.subjects = subjects
        self.cosponsors = cosponsors
        self.actions = actions
        self.sources = sources
    }
}
