//
//  GovernmentBillStatusHistoryStatus.swift
//
//
//  Created by Evan Anderson on 7/22/22.
//

import Foundation
import SwiftSovereignStates

public enum GovernmentBillStatusHistoryStatuses {
    static func valueOfCacheID(_ cacheID: String) -> (any GovernmentBillStatusHistoryStatus)? {
        return nil
    }
}

public protocol GovernmentBillStatusHistoryStatus : Jsonable {
    func getCountry() -> Country
    func getIdentifier() -> String
    func getCacheID() -> String
    func getName() -> String
}
public extension GovernmentBillStatusHistoryStatus {
    func getCacheID() -> String {
        return getCountry().getCacheID() + "_" + getIdentifier()
    }
    func wrapped() -> GovernmentBillStatusHistoryStatusWrapper {
        return GovernmentBillStatusHistoryStatusWrapper(self)
    }
}
public extension GovernmentBillStatusHistoryStatus where Self : RawRepresentable, RawValue == String {
    func getIdentifier() -> String {
        return rawValue
    }
}
public extension GovernmentBillStatusHistoryStatus where Self : CaseIterable {
    static func valueOf(_ string: String?) -> Self? {
        guard let string:String = string else { return nil }
        return Self.allCases.first(where: { string.compare("\($0)") == .orderedSame || string.compare($0.getName()) == .orderedSame || string.lowercased().starts(with: $0.getName().lowercased()) })
    }
}

public struct GovernmentBillStatusHistoryStatusWrapper : GovernmentBillStatusHistoryStatus {
    public static func == (lhs: GovernmentBillStatusHistoryStatusWrapper, rhs: GovernmentBillStatusHistoryStatusWrapper) -> Bool {
        return lhs.status.getCacheID().elementsEqual(rhs.getCacheID())
    }
    
    public let status:any GovernmentBillStatusHistoryStatus
    
    public init(_ status: any GovernmentBillStatusHistoryStatus) {
        self.status = status
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        guard let status:any GovernmentBillStatusHistoryStatus = GovernmentBillStatusHistoryStatuses.valueOfCacheID(string) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid cacheID for GovernmentBillStatusHistoryStatus \"" + string + "\"")
        }
        self.status = status
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(getCacheID())
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(getCacheID())
    }
    
    public func getCountry() -> Country {
        return status.getCountry()
    }
    public func getIdentifier() -> String {
        return status.getIdentifier()
    }
    public func getName() -> String {
        return status.getName()
    }
}
