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
        return getGovernmentChambers()?.first(where: { $0.getIdentifier().elementsEqual(string) || $0.getName().compare(string) == .orderedSame })
    }
    func valueOfGovernmentChamberCacheID(_ cacheID: String) -> (any GovernmentChamber)? {
        return getGovernmentChambers()?.first(where: { $0.getCacheID().elementsEqual(cacheID) })
    }
    func getGovernmentChambers() -> [any GovernmentChamber]? {
        return GovernmentChambers.get(self)
    }
}

public protocol GovernmentChamber : JsonableNoTranslationKeys {
    func getCountry() -> Country
    func getCacheID() -> String
    func getIdentifier() -> String
    func getName() -> String
}
public extension GovernmentChamber {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    func getCacheID() -> String {
        return getCountry().getCacheID() + "," + getIdentifier()
    }
    func getIdentifier() -> String {
        return String(describing: self)
    }
    func wrapped() -> GovernmentChamberWrapper {
        return GovernmentChamberWrapper(self)
    }
}
public extension GovernmentChamber where Self : CaseIterable {
    static func valueOf(_ string: String) -> Self? {
        return Self.allCases.first(where: { string.elementsEqual($0.getIdentifier()) || string.compare($0.getName()) == .orderedSame })
    }
}

public struct GovernmentChamberWrapper : GovernmentChamber {    
    public let chamber:any GovernmentChamber
    
    public init(_ chamber: any GovernmentChamber) {
        self.chamber = chamber
    }
    public init?(_ description: String) {
        guard let chamber:any GovernmentChamber = nil else { return nil }
        self.chamber = chamber
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        let cacheIDValues:[String] = string.components(separatedBy: ",")
        guard cacheIDValues.count == 2 else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid GovernmentChamber Cache ID \"" + string + "\"")
        }
        let countryCacheID:String = cacheIDValues[0]
        guard let country:Country = Country.valueOfCacheID(countryCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid Country Cache ID \"" + countryCacheID + "\"")
        }
        let chamberCacheID:String = cacheIDValues[1]
        guard let chamber:any GovernmentChamber = country.valueOfGovernmentChamberCacheID(chamberCacheID) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid GovernmentChamber Cache ID \"" + chamberCacheID + "\" for Country \"" + countryCacheID + "\"")
        }
        self.chamber = chamber
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(getCacheID())
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(getCacheID())
    }
    
    public func getCountry() -> SwiftSovereignStates.Country {
        return chamber.getCountry()
    }
    public func getName() -> String {
        return chamber.getName()
    }
}
