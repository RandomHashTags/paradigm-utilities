//
//  GovernmentBillAction.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct GovernmentBillAction : Jsonable {
    public typealias TranslationKeys = GovernmentBillActionTranslationKeys
    
    public let chamber:String?
    public var title:String
    public let time:TimeInterval
    
    public init(chamber: (any GovernmentChamber)?, title: String, time: TimeInterval) {
        self.chamber = chamber?.getIdentifier()
        self.title = title
        self.time = time
    }
    
    public func getTranslationKeyValue(key: GovernmentBillActionTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        }
    }
    public mutating func setTranslationKeyValue<T>(key: GovernmentBillActionTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        }
    }
}

public enum GovernmentBillActionTranslationKeys : String, JsonableTranslationKey {
    case title
}
