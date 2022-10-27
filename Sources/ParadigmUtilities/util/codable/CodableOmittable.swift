//
//  CodableOmittable.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

import Foundation

@propertyWrapper
public struct CodableOmittable<T : Codable & Hashable> : Codable, Hashable {
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
        guard let wrappedValue:T = value.wrappedValue, !value.omitted else { return }
        try encode(wrappedValue, forKey: key)
    }
}
extension KeyedDecodingContainer {
    public func decode<T>(_ value: CodableOmittable<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> CodableOmittable<T> {
        if let value:CodableOmittable<T> = try decodeIfPresent(value, forKey: key) {
            return value
        }
        return CodableOmittable<T>(nil)
    }
}
