//
//  PreEnactedBill.swift
//
//
//  Created by Evan Anderson on 7/20/22.
//

import Foundation

public struct PreEnactedBill : Jsonable {
    public typealias TranslationKeys = PreEnactedBillTranslationKeys
    
    public let id:String
    public var title:String
    public let chamber:GovernmentChamberWrapper, status:GovernmentBillStatusWrapper
    
    public init(id: String, title: String, chamber: any GovernmentChamber, status: any GovernmentBillStatus) {
        self.id = id
        self.title = title
        self.chamber = chamber.wrapped()
        self.status = status.wrapped()
    }
    
    public func getKeyValue(key: PreEnactedBillTranslationKeys) -> Any? {
        switch key {
        case .title: return title
        }
    }
    public mutating func setKeyValue<T>(key: PreEnactedBillTranslationKeys, value: T) {
        switch key {
        case .title:
            title = value as! String
            break
        }
    }
}

public enum PreEnactedBillTranslationKeys : String, JsonableTranslationKey {
    case title
}
