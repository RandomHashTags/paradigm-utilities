//
//  GovernmentPreAdministrationBill.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation
import SwiftSovereignStates

public struct GovernmentPreAdministrationBill : Jsonable {
    public typealias TranslationKeys = GovernmentPreAdministrationBillTranslationKeys
    
    public let chamber:GovernmentChamberWrapper, statuses:[GovernmentBillStatusWrapper], id:String
    public var title:String, committees:String?, notes:String?
    public let date:EventDate
    
    public init(chamber: any GovernmentChamber, statuses: [any GovernmentBillStatus], id: String, title: String, committees: String?, notes: String?, date: EventDate) {
        self.chamber = chamber.wrapped()
        self.statuses = statuses.map({ $0.wrapped() })
        self.id = id
        self.title = title
        self.committees = committees
        self.notes = notes
        self.date = date
    }
    
    public func getTranslationKeyValue(key: GovernmentPreAdministrationBillTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        case .committees: return committees
        case .notes: return notes
        }
    }
    public mutating func setTranslationKeyValue<T>(key: GovernmentPreAdministrationBillTranslationKeys, value: T) {
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
        }
    }
}

public enum GovernmentPreAdministrationBillTranslationKeys : String, JsonableTranslationKey {
    case title
    case committees
    case notes
}
