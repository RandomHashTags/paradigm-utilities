//
//  GovernmentChamber.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation
import SwiftSovereignStates

public enum GovernmentChambers {
    public static func get(_ country: Country) -> [any GovernmentChamber]? {
        switch country {
        case .united_states: return GovernmentChamberUnitedStates.allCases
        default: return nil
        }
    }
}
public extension Country {
    func valueOfGovernmentChamber(_ string: String) -> (any GovernmentChamber)? {
        return getGovernmentChambers()?.first(where: { $0.rawValue.elementsEqual(string) || $0.name.compare(string) == .orderedSame })
    }
    func valueOfGovernmentChamberCacheID(_ cacheID: String) -> (any GovernmentChamber)? {
        return getGovernmentChambers()?.first(where: { $0.cache_id.elementsEqual(cacheID) })
    }
    func getGovernmentChambers() -> [any GovernmentChamber]? {
        return GovernmentChambers.get(self)
    }
}

public protocol GovernmentChamber : Jsonable, RawRepresentable where RawValue == String {
    var country : Country { get }
    var cache_id : String { get }
    var name : String { get }
}
public extension GovernmentChamber {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.cache_id.elementsEqual(rhs.cache_id)
    }
    var cache_id : String {
        return country.cache_id + "," + rawValue
    }
    func wrapped() -> GovernmentChamberWrapper {
        return GovernmentChamberWrapper(self)
    }
}
public extension GovernmentChamber where Self : CaseIterable {
    static func valueOf(_ string: String) -> Self? {
        return Self.allCases.first(where: { string.elementsEqual($0.rawValue) || string.compare($0.name) == .orderedSame })
    }
}

public struct GovernmentChamberWrapper : GovernmentChamber {
    public var rawValue: String
    
    public let chamber:any GovernmentChamber
    
    public init(_ chamber: any GovernmentChamber) {
        self.chamber = chamber
        rawValue = chamber.rawValue
    }
    public init?(rawValue: String) {
        guard let chamber:any GovernmentChamber = nil else { return nil } // TODO: fix
        self.chamber = chamber
        self.rawValue = rawValue
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        let cacheIDValues:[String] = string.components(separatedBy: ",")
        guard cacheIDValues.count == 2 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid GovernmentChamber Cache ID \"" + string + "\"")
        }
        let countryCacheID:String = cacheIDValues[0]
        guard let country:Country = Country.init(rawValue: countryCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid Country Cache ID \"" + countryCacheID + "\"")
        }
        let chamberCacheID:String = cacheIDValues[1]
        guard let chamber:any GovernmentChamber = country.valueOfGovernmentChamberCacheID(chamberCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid GovernmentChamber Cache ID \"" + chamberCacheID + "\" for Country \"" + countryCacheID + "\"")
        }
        self.chamber = chamber
        rawValue = chamberCacheID
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(cache_id)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(cache_id)
    }
    
    public var country : Country {
        return chamber.country
    }
    public var name : String {
        return chamber.name
    }
}
