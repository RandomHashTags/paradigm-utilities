//
//  GovernmentPreAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation
import SwiftSovereignStates

public struct GovernmentPreAdministrationBill : Jsonable {
    public typealias ValueKeys = GovernmentPreAdministrationBillValueKeys
    
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
    
    public func getKeyValue(key: GovernmentPreAdministrationBillValueKeys) -> Any? {
        switch key {
        case .chamber: return chamber
        case .statuses: return statuses
        case .id: return id
        case .title: return title
        case .committees: return committees
        case .notes: return notes
        case .date: return date
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentPreAdministrationBillValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        case .committees:
            committees = value as? String
            break
        case .notes:
            notes = value as? String
            break
        default:
            break
        }
    }
}

public enum GovernmentPreAdministrationBillValueKeys : String, JsonableValueKeys {
    case chamber
    case statuses
    case id
    case title
    case committees
    case notes
    case date
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title, .committees, .notes:
            return true
        default:
            return false
        }
    }
}
