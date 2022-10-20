//
//  GovernmentBillStatus.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation
import SwiftSovereignStates

public protocol GovernmentBillStatus : Jsonable {
    func getCountry() -> Country
    func getIdentifier() -> String
    func getName() -> String
    func getControllerTitle() -> String
}
public extension GovernmentBillStatus {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.getCountry() == rhs.getCountry() && lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(getCountry())
        hasher.combine(getIdentifier())
    }
}
public extension GovernmentBillStatus where Self : CaseIterable {
    static func valueOf(_ string: String?) -> Self? {
        guard let string:String = string else { return nil }
        return Self.allCases.first(where: { string.elementsEqual($0.getIdentifier()) })
    }
}
public extension GovernmentBillStatus where Self : RawRepresentable, RawValue == String {
    func getIdentifier() -> String {
        return String(describing: self)
    }
}

public extension Country {
    func valueOfGovernmentBillStatus(_ string: String) -> (any GovernmentBillStatus)? {
        return getGovernmentBillStatuses()?.first(where: { $0.getIdentifier().elementsEqual(string) || $0.getName().compare(string) == .orderedSame })
    }
    func getGovernmentBillStatuses() -> [any GovernmentBillStatus]? {
        switch self {
        case .united_states: return GovernmentBillStatusUnitedStates.allCases
        default: return nil
        }
    }
}


public struct GovernmentBillStatusWrapper : GovernmentBillStatus {
    public let status:any GovernmentBillStatus
    
    public init(status: any GovernmentBillStatus) {
        self.status = status
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        let components:[String] = string.components(separatedBy: "1")
        guard components.count == 2 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid decoded string \"" + string + "\"")
        }
        let countryCacheID:String = components[0]
        guard let country:Country = Country.valueOfCacheID(countryCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "couldn't find Country with cacheID \"" + countryCacheID + "\"")
        }
        let statusID:String = components[1]
        guard let status:any GovernmentBillStatus = country.valueOfGovernmentBillStatus(statusID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "couldn't find GovernmentBillStatus in Country \"" + countryCacheID + "\" with statusID \"" + statusID + "\"")
        }
        self.status = status
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        let string:String = getCountry().getCacheID() + "1" + getIdentifier()
        try container.encode(string)
    }
    
    public func getCountry() -> SwiftSovereignStates.Country {
        return status.getCountry()
    }
    public func getIdentifier() -> String {
        return status.getIdentifier()
    }
    public func getName() -> String {
        return status.getName()
    }
    public func getControllerTitle() -> String {
        return status.getControllerTitle()
    }
}
