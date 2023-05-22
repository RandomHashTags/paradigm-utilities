//
//  CodableAlwaysOmittable.swift
//  
//
//  Created by Evan Anderson on 5/21/23.
//

import Foundation

public protocol CodableAlwaysOmittableProtocol : Codable, Hashable {
    associatedtype T : Codable & Hashable
    
    var wrappedValue:T { get set }
}

/// Used server-side to indicate that the variable can will always be removed when encoded to JSON.
@propertyWrapper
public final class CodableAlwaysOmittable<T : Codable & Hashable> : CodableAlwaysOmittableProtocol {
    public static func == (lhs: CodableAlwaysOmittable<T>, rhs: CodableAlwaysOmittable<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public var wrappedValue:T
    
    public init(_ wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    public init(from decoder: Decoder) throws {
        throw CodableAlwaysOmittableError.tried_decoding
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(wrappedValue)
    }
}

public enum CodableAlwaysOmittableError : Error {
    case tried_decoding
    
    var description : String {
        switch self {
        case .tried_decoding: return "tried to decode a `CodableAlwaysOmittable` variable, which is illegal!"
        }
    }
}

extension KeyedEncodingContainer {
    public mutating func encode<T>(_ value: CodableAlwaysOmittable<T>, forKey key: KeyedEncodingContainer<K>.Key) throws {
        return
    }
}
extension KeyedDecodingContainer {
    public func decode<T>(_ value: CodableAlwaysOmittable<T>.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> CodableAlwaysOmittable<T> {
        throw CodableAlwaysOmittableError.tried_decoding
    }
}
