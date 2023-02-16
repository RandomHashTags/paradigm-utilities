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

public protocol GovernmentBillStatusHistoryStatus : Jsonable, RawRepresentable where RawValue == String {
    var country : Country { get }
    var cache_id : String { get }
    func getName() -> String
}
public extension GovernmentBillStatusHistoryStatus {
    var cache_id : String {
        return country.cache_id + "_" + rawValue
    }
    func wrapped() -> GovernmentBillStatusHistoryStatusWrapper {
        return GovernmentBillStatusHistoryStatusWrapper(self)
    }
}
public extension GovernmentBillStatusHistoryStatus where Self : CaseIterable {
    static func valueOf(_ string: String?) -> Self? {
        guard let string:String = string else { return nil }
        return Self.allCases.first(where: { string.compare("\($0)") == .orderedSame || string.compare($0.getName()) == .orderedSame || string.lowercased().starts(with: $0.getName().lowercased()) })
    }
}

public struct GovernmentBillStatusHistoryStatusWrapper : GovernmentBillStatusHistoryStatus {
    public init?(rawValue: String) {
        return nil // TODO: fix
    }
    
    public var rawValue: String
    
    public static func == (lhs: GovernmentBillStatusHistoryStatusWrapper, rhs: GovernmentBillStatusHistoryStatusWrapper) -> Bool {
        return lhs.status.cache_id.elementsEqual(rhs.cache_id)
    }
    
    public let status:any GovernmentBillStatusHistoryStatus
    
    public init(_ status: any GovernmentBillStatusHistoryStatus) {
        self.status = status
        rawValue = status.rawValue
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        guard let status:any GovernmentBillStatusHistoryStatus = GovernmentBillStatusHistoryStatuses.valueOfCacheID(string) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid cacheID for GovernmentBillStatusHistoryStatus \"" + string + "\"")
        }
        self.status = status
        rawValue = string.components(separatedBy: "_")[1] // TODO: fix
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(cache_id)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(cache_id)
    }
    
    public var country : Country {
        return status.country
    }
    public func getName() -> String {
        return status.getName()
    }
}
