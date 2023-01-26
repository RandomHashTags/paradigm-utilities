//
//  CodableOmittable.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

public protocol CodableOmittableProtocol : Codable, Hashable {
    associatedtype T : Codable & Hashable
    
    var wrappedValue:T? { get }
    var omitted:Bool { get set }
}

/// Used server-side to indicate that the variable can be removed, when encoded to JSON, when present in the client's `query`.
@propertyWrapper
public struct CodableOmittable<T : Codable & Hashable> : CodableOmittableProtocol {
    public let wrappedValue:T?
    public var omitted:Bool
    
    public init(_ wrappedValue: T?) {
        self.init(wrappedValue, omitted: wrappedValue == nil)
    }
    public init(_ wrappedValue: T?, omitted: Bool) {
        self.wrappedValue = wrappedValue
        self.omitted = omitted
    }
    public init(from decoder: Decoder) throws {
        wrappedValue = try decoder.singleValueContainer().decode(T.self)
        omitted = false
    }
}

extension KeyedEncodingContainer {
    public mutating func encode<T>(_ value: CodableOmittable<T>, forKey key: KeyedEncodingContainer<K>.Key) throws {
        let wrapped_value:T? = value.wrappedValue
        guard !value.omitted && !((wrapped_value as? (any JsonableProtocol))?.all_values_are_nil() ?? false) else { return }
        try encode(wrapped_value, forKey: key)
    }
}
extension KeyedDecodingContainer {
    public func decode<T>(_ value: CodableOmittable<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> CodableOmittable<T> {
        return try decodeIfPresent(value, forKey: key) ?? CodableOmittable<T>(nil)
    }
}
