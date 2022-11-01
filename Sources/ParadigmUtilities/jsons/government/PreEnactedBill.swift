//
//  PreEnactedBill.swift
//
//
//  Created by Evan Anderson on 7/20/22.
//

import Foundation

public struct PreEnactedBill : Jsonable {
    public typealias ValueKeys = PreEnactedBillValueKeys
    
    public let id:String
    public var title:String
    public let chamber:GovernmentChamberWrapper, status:GovernmentBillStatusWrapper
    
    public init(id: String, title: String, chamber: any GovernmentChamber, status: any GovernmentBillStatus) {
        self.id = id
        self.title = title
        self.chamber = chamber.wrapped()
        self.status = status.wrapped()
    }
    
    public func getKeyValue(key: PreEnactedBillValueKeys) -> Any? {
        switch key {
        case .id: return id
        case .title: return title
        case .chamber: return chamber
        case .status: return status
        }
    }
    public mutating func setKeyValue<T>(key: PreEnactedBillValueKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        default:
            break
        }
    }
}

public enum PreEnactedBillValueKeys : String, JsonableValueKeys {
    case id
    case title
    case chamber
    case status
    
    public func isTranslatable() -> Bool {
        switch self {
        case .title:
            return true
        default:
            return false
        }
    }
}
