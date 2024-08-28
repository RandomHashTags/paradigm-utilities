//
//  GovernmentBillAction.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct GovernmentBillAction : Jsonable {
    public typealias JSONKeys = GovernmentBillActionValueKeys
    
    public let chamber:GovernmentChamberWrapper?
    public var title:String
    public let time:TimeInterval
    
    public init(chamber: (any GovernmentChamber)?, title: String, time: TimeInterval) {
        self.chamber = chamber?.wrapped()
        self.title = title
        self.time = time
    }
    
    public func getKeyValue(key: GovernmentBillActionValueKeys) -> Any? {
        switch key {
        case .chamber: return chamber
        case .title: return title
        case .time: return time
        }
    }
    public mutating func setKeyValue<T>(key: GovernmentBillActionValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        default:
            break
        }
    }
}

public enum GovernmentBillActionValueKeys : String, JsonableKeys {
    case chamber
    case title
    case time
}
