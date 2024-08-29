//
//  GovernmentBillStatus.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import SwiftSovereignStates

public protocol GovernmentBillStatus : Jsonable, CaseIterable, RawRepresentable where RawValue == String {
    var country : Country { get }
    var cache_id : String { get }
    var name : String { get }
    var controller_title : String { get }
}
public extension GovernmentBillStatus {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.cache_id.elementsEqual(rhs.cache_id)
    }
    
    var cache_id : String {
        return country.cache_id + "," + rawValue
    }
    func wrapped() -> GovernmentBillStatusWrapper {
        return GovernmentBillStatusWrapper(self)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(cache_id)
    }
}
public extension GovernmentBillStatus where Self : CaseIterable {
    static func valueOf(_ string: String?) -> Self? {
        guard let string:String = string else { return nil }
        return Self.allCases.first(where: { string.elementsEqual($0.rawValue) })
    }
}

public extension Country {
    func valueOfGovernmentBillStatus(_ string: String) -> (any GovernmentBillStatus)? {
        return getGovernmentBillStatuses()?.first(where: { $0.rawValue.elementsEqual(string) || $0.name.compare(string) == .orderedSame })
    }
    func getGovernmentBillStatuses() -> [any GovernmentBillStatus]? {
        switch self {
        case .united_states: return GovernmentBillStatusUnitedStates.allCases
        default: return nil
        }
    }
}


public struct GovernmentBillStatusWrapper : GovernmentBillStatus {
    public static var allCases: [GovernmentBillStatusWrapper] = []
    
    public init?(rawValue: String) {
        return nil // TODO: fix
    }
    
    public var rawValue: String
    
    public let status:any GovernmentBillStatus
    
    public init(_ status: any GovernmentBillStatus) {
        self.status = status
        rawValue = status.rawValue
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        let components:[String] = string.components(separatedBy: "1")
        guard components.count == 2 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid decoded string \"" + string + "\"")
        }
        let countryCacheID:String = components[0]
        guard let country:Country = Country.init(rawValue: countryCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "couldn't find Country with cacheID \"" + countryCacheID + "\"")
        }
        let statusID:String = components[1]
        guard let status:any GovernmentBillStatus = country.valueOfGovernmentBillStatus(statusID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "couldn't find GovernmentBillStatus in Country \"" + countryCacheID + "\" with statusID \"" + statusID + "\"")
        }
        self.status = status
        rawValue = statusID
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        let string:String = country.cache_id + "1" + rawValue
        try container.encode(string)
    }
    
    public var country : Country {
        return status.country
    }
    public var name : String {
        return status.name
    }
    public var controller_title : String {
        return status.controller_title
    }
}
