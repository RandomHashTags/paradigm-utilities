//
//  GovernmentAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation

struct GovernmentAdministrationBill : Jsonable {
    let sponsor:GovernmentPrePolitician?, summary:String?, policyArea:String?, subjects:[String]?, cosponsors:[GovernmentPrePolitician]?, actions:[GovernmentBillAction]?, sources:EventSources
    
    init(sponsor: GovernmentPrePolitician?, summary: String?, policyArea: (any GovernmentPolicyArea)?, subjects: [String]?, cosponsors: [GovernmentPrePolitician]?, actions: [GovernmentBillAction]?, sources: EventSources) {
        self.sponsor = sponsor
        self.summary = summary
        self.policyArea = policyArea?.rawValue
        self.subjects = subjects
        self.cosponsors = cosponsors
        self.actions = actions
        self.sources = sources
    }
}
