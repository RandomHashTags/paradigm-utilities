//
//  CodableAlwaysOmittable.swift
//  
//
//  Created by Evan Anderson on 5/21/23.
//

import Foundation

public protocol CodableAlwaysOmittableProtocol : Codable, Hashable {
    associatedtype T : Codable & Hashable
    
    var wrappedValue:T? { get set }
}

/// Used server-side to indicate that the variable can will always be removed when encoded to JSON.
@propertyWrapper
public final class CodableAlwaysOmittable<T : Codable & Hashable> : CodableAlwaysOmittableProtocol {
    public static func == (lhs: CodableAlwaysOmittable<T>, rhs: CodableAlwaysOmittable<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public var wrappedValue:T?
    
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
    public init(from decoder: Decoder) throws {
        wrappedValue = nil
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

extension KeyedEncodingContainer {
    public mutating func encode<T>(_ value: CodableAlwaysOmittable<T>, forKey key: KeyedEncodingContainer<K>.Key) throws {
    }
}
extension KeyedDecodingContainer {
    public func decode<T>(_ value: CodableAlwaysOmittable<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> CodableAlwaysOmittable<T> {
        return CodableAlwaysOmittable<T>(nil)
    }
}
