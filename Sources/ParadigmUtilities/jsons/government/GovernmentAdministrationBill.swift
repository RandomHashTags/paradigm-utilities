//
//  GovernmentAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation

public struct GovernmentAdministrationBill : Jsonable {
    public typealias ValueKeys = GovernmentAdministrationBillValueKeys
    
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
    
    public func getKeyValue(key: GovernmentAdministrationBillValueKeys) -> Any? {
        switch key {
        case .title: return title
        case .sponsor: return sponsor
        case .summary: return summary
        case .policy_area: return policy_area
        case .subjects: return subjects
        case .cosponsors: return cosponsors
        case .actions: return actions
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentAdministrationBillValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .sponsor:
            sponsor = value as? GovernmentPrePolitician
            break
        case .summary:
            summary = value as? String
            break
        case .policy_area:
            policy_area = value as? String
            break
        case .subjects:
            subjects = value as? [String]
            break
        case .cosponsors:
            cosponsors = value as? [GovernmentPrePolitician]
            break
        case .actions:
            actions = value as? [GovernmentBillAction]
            break
        case .sources:
            sources = value as! EventSources
            break
        }
    }
}

public enum GovernmentAdministrationBillValueKeys : String, JsonableValueKeys {
    case title
    case sponsor
    case summary
    case policy_area
    case subjects
    case cosponsors
    case actions
    case sources
    
    public func isTranslatable() -> Bool {
        return true
    }
}
