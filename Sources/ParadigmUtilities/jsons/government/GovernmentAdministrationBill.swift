//
//  GovernmentAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

public struct GovernmentAdministrationBill : Jsonable {    
    public var title:String, sponsor:GovernmentPrePolitician?, summary:String?, policy_area:String?, subjects:[String]?, cosponsors:[GovernmentPrePolitician]?, actions:[GovernmentBillAction]?, sources:EventSources
    
    public init(title: String, sponsor: GovernmentPrePolitician?, summary: String?, policyArea: (any GovernmentPolicyArea)?, subjects: [String]?, cosponsors: [GovernmentPrePolitician]?, actions: [GovernmentBillAction]?, sources: EventSources) {
        self.title = title
        self.sponsor = sponsor
        self.summary = summary
        self.policy_area = policyArea?.rawValue
        self.subjects = subjects
        self.cosponsors = cosponsors
        self.actions = actions
        self.sources = sources
    }
}